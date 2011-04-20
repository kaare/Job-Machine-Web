package Job::Machine::Web::Controller::Jobmachine;

use 5.010;
use Moose;
extends 'Mojolicious::Controller';

use Data::Dumper;

sub task_list {
	my $self = shift;
	my $db = $self->model->db;
	my $dbschema = $self->model->schema;
	my $status = $self->param('status');
	my $class_id = $self->param('class_id');
say Dumper $self->where($status, $class_id);
	my ($where, $data) = $self->where($status, $class_id);
	my $statuses = $self->get_statuses($status);
	my $classes = $self->get_classes($class_id);
	my $sql = qq{
		SELECT
			*
		FROM
			$dbschema.task
		$where
		ORDER BY
			task_id DESC
	};
say "$status - $class_id, $sql ", Dumper $data;
	my $tasks = $db->select_all(
		sql => $sql,
		data => $data,
	);
	$self->render(
		classes => $classes,
		statuses => $statuses,
		tasks => $tasks,
	);
}

sub task {
	my $self = shift;
	my $db = $self->model->db;
	my $dbschema = $self->model->schema;
	my $task_id = $self->stash('id');
	my $results = $self->get_results($task_id);
	my $sql = qq{
		SELECT
			*
		FROM
			$dbschema.task
		WHERE
			task_id = ?
	};
	my $data = [ $task_id ];
	my $task = $db->select_first(
		sql => $sql,
		data => $data,
	);
	$self->render(
		task => $task,
		results => $results,
	);
}

sub where {
	my $self = shift;
	return unless my @indata = @_;

	my @where = grep {defined($_->{data}) and $_->{data} ne ''}
		map {my $data = shift @indata; {key => $_, data => $data, where => "$_ = ?\n"} }
		qw/status class_id/;
	my ($where_clause, $outdata);
	if (@where) {
		$where_clause = "WHERE ".join ' AND ', map {$_->{where}} @where;
		$outdata = [map {$_->{data}} @where];
	}
	return $where_clause, $outdata;
}

sub get_classes {
	my ($self, $class_id) = @_;
	my $db = $self->model->db;
	my $dbschema = $self->model->schema;
	my $sql = qq{
		SELECT
			class_id id, name
		FROM
			$dbschema.class
		ORDER BY
			class_id DESC
	};
	my $classes = $db->select_all(
		sql => $sql,
	);
	my @cl = map {$_->{selected} = $_->{id} == $class_id;$_} @{$classes};
	unshift @cl, {class_id => 0, name => 'All'};
	return \@cl;
}

sub get_statuses {
	my ($self, $status) = @_;
	my $statuses = [
		{ id => undef, name => 'All'},
		{  id => 0, name => 'New'},
		{id => 100, name => 'Started'},
		{id => 200, name => 'Finished'},
		{id => 900, name => 'Failed'},
	];
	return [ map {$_->{selected} = $_->{id} eq $status;$_} @{$statuses} ];
}

sub get_results {
	my ($self, $task_id) = @_;
	my $db = $self->model->db;
	my $dbschema = $self->model->schema;
	my $sql = qq{
		SELECT
			*
		FROM
			$dbschema.result
		WHERE
			task_id = ?
		ORDER BY
			result_id DESC
	};
	my $data = [ $task_id ];
	my $results = $db->select_all(
		sql => $sql,
		data => $data
	);
	return $results;
}

1;

package Job::Machine::Web;

use 5.010;
use Moose;
use Config::Any;
use Job::Machine::Web::Model;

extends 'Mojolicious';

# This method will run once at server start
sub startup {
	my $self = shift;
	# Config
	my $config = $self->config;
	$self->helper(config => sub { return $config });
	# Model
	my $model = Job::Machine::Web::Model->new({
		connect_info => $config->{connect_info},
		schema => $config->{schema},
	});
	$self->helper(model => sub { return $model });
	# Plugins
	$self->plugin('xslate_renderer');
	# Routes
	my $r = $self->routes;
	$r->namespace('Job::Machine::Web::Controller');
	$r->route('/')->to('jobmachine#task_list');
	$r->route('/task/:id')->to('jobmachine#task');
}

sub config {
	my $confname = lc(__PACKAGE__) . '.conf';
	$confname =~ s/://g;
	my $config = Config::Any->load_files( { files => [$confname], use_ext => 1 } );
	return $config->[0]->{$confname};
}

1;
# ABSTRACT: Web overview for Job::Machine

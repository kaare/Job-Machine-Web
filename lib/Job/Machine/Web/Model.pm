package Job::Machine::Web::Model;

use 5.010;
use Moose;
use Job::Machine::DB;

has 'connect_info' => (
	is      => 'ro',
	isa     => 'ArrayRef',
	trigger => sub {
		my ( $self, $ci ) = @_;
		$self->db(Job::Machine::DB->new(
			dsn      => $ci->[0],
			user     => $ci->[1],
			password => $ci->[2],
			db_attr  => $ci->[3],
		));
    },
);
has 'schema' => (isa => 'Str', is => 'ro');
has 'db' => (
	is      => 'rw',
	isa     => 'Job::Machine::DB',
);

__PACKAGE__->meta()->make_immutable();

no Moose;
no MooseX::ClassAttribute;

1;

=head1 NAME

Job::Machine::Web::Model - MVC Model for Job::Machine::Web

=head1 ATTRIBUTES

=head2 connect_info

An ArrayRef containing
	dsn
	user
	password
	db_attr

=head2 schema

The PostgreSQL DB Schema containing Job::Machine's tables.

=head2 db

Job::Machine::DB object derived from connect_info
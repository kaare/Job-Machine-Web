package Job::Machine::Schema::Result::Class;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Job::Machine::Schema::Result::Class

=cut

__PACKAGE__->table("jobmachine.class");

=head1 ACCESSORS

=head2 class_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'jobmachine.class_class_id_seq'

=head2 name

  data_type: 'text'
  is_nullable: 1

=head2 created

  data_type: 'timestamp'
  default_value: current_timestamp
  is_nullable: 0
  original: {default_value => \"now()"}

=head2 modified

  data_type: 'timestamp'
  default_value: current_timestamp
  is_nullable: 0
  original: {default_value => \"now()"}

=cut

__PACKAGE__->add_columns(
  "class_id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "jobmachine.class_class_id_seq",
  },
  "name",
  { data_type => "text", is_nullable => 1 },
  "created",
  {
    data_type     => "timestamp",
    default_value => \"current_timestamp",
    is_nullable   => 0,
    original      => { default_value => \"now()" },
  },
  "modified",
  {
    data_type     => "timestamp",
    default_value => \"current_timestamp",
    is_nullable   => 0,
    original      => { default_value => \"now()" },
  },
);
__PACKAGE__->set_primary_key("class_id");

=head1 RELATIONS

=head2 schedules

Type: has_many

Related object: L<Job::Machine::Schema::Result::Schedule>

=cut

__PACKAGE__->has_many(
  "schedules",
  "Job::Machine::Schema::Result::Schedule",
  { "foreign.class_id" => "self.class_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 tasks

Type: has_many

Related object: L<Job::Machine::Schema::Result::Task>

=cut

__PACKAGE__->has_many(
  "tasks",
  "Job::Machine::Schema::Result::Task",
  { "foreign.class_id" => "self.class_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07007 @ 2011-04-13 09:40:17
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:gwoPH0m7mZnTXLLDih7ylg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;

package Job::Machine::Schema::Result::Task;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Job::Machine::Schema::Result::Task

=cut

__PACKAGE__->table("jobmachine.task");

=head1 ACCESSORS

=head2 task_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'jobmachine.task_task_id_seq'

=head2 transaction_id

  data_type: 'integer'
  is_nullable: 1

=head2 class_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 grouping

  data_type: 'text'
  is_nullable: 1

=head2 title

  data_type: 'text'
  is_nullable: 1

=head2 parameters

  data_type: 'text'
  is_nullable: 1

=head2 status

  data_type: 'integer'
  is_nullable: 0

=head2 run_after

  data_type: 'timestamp'
  is_nullable: 1

=head2 remove_after

  data_type: 'timestamp'
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
  "task_id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "jobmachine.task_task_id_seq",
  },
  "transaction_id",
  { data_type => "integer", is_nullable => 1 },
  "class_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "grouping",
  { data_type => "text", is_nullable => 1 },
  "title",
  { data_type => "text", is_nullable => 1 },
  "parameters",
  { data_type => "text", is_nullable => 1 },
  "status",
  { data_type => "integer", is_nullable => 0 },
  "run_after",
  { data_type => "timestamp", is_nullable => 1 },
  "remove_after",
  { data_type => "timestamp", is_nullable => 1 },
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
__PACKAGE__->set_primary_key("task_id");

=head1 RELATIONS

=head2 dependencies_depends

Type: has_many

Related object: L<Job::Machine::Schema::Result::Dependency>

=cut

__PACKAGE__->has_many(
  "dependencies_depends",
  "Job::Machine::Schema::Result::Dependency",
  { "foreign.depends" => "self.task_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 dependencies_depended

Type: has_many

Related object: L<Job::Machine::Schema::Result::Dependency>

=cut

__PACKAGE__->has_many(
  "dependencies_depended",
  "Job::Machine::Schema::Result::Dependency",
  { "foreign.depended" => "self.task_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 results

Type: has_many

Related object: L<Job::Machine::Schema::Result::Result>

=cut

__PACKAGE__->has_many(
  "results",
  "Job::Machine::Schema::Result::Result",
  { "foreign.task_id" => "self.task_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 class

Type: belongs_to

Related object: L<Job::Machine::Schema::Result::Class>

=cut

__PACKAGE__->belongs_to(
  "class",
  "Job::Machine::Schema::Result::Class",
  { class_id => "class_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "CASCADE",
    on_update     => "CASCADE",
  },
);


# Created by DBIx::Class::Schema::Loader v0.07007 @ 2011-04-13 09:40:17
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:QJpKxWXJL/nJdpms7babuA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;

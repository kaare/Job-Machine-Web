package Job::Machine::Schema::Result::Result;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Job::Machine::Schema::Result::Result

=cut

__PACKAGE__->table("jobmachine.result");

=head1 ACCESSORS

=head2 result_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'jobmachine.result_result_id_seq'

=head2 task_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 result

  data_type: 'text'
  is_nullable: 1

=head2 resulttype

  data_type: 'text'
  is_nullable: 1

=head2 created

  data_type: 'timestamp'
  default_value: current_timestamp
  is_nullable: 0
  original: {default_value => \"now()"}

=cut

__PACKAGE__->add_columns(
  "result_id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "jobmachine.result_result_id_seq",
  },
  "task_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "result",
  { data_type => "text", is_nullable => 1 },
  "resulttype",
  { data_type => "text", is_nullable => 1 },
  "created",
  {
    data_type     => "timestamp",
    default_value => \"current_timestamp",
    is_nullable   => 0,
    original      => { default_value => \"now()" },
  },
);
__PACKAGE__->set_primary_key("result_id");

=head1 RELATIONS

=head2 task

Type: belongs_to

Related object: L<Job::Machine::Schema::Result::Task>

=cut

__PACKAGE__->belongs_to(
  "task",
  "Job::Machine::Schema::Result::Task",
  { task_id => "task_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "CASCADE",
    on_update     => "CASCADE",
  },
);


# Created by DBIx::Class::Schema::Loader v0.07007 @ 2011-04-13 09:40:17
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:ExrmAZIGENeweTbIdENLxQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;

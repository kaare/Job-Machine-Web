package Job::Machine::Schema::Result::Schedule;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Job::Machine::Schema::Result::Schedule

=cut

__PACKAGE__->table("jobmachine.schedule");

=head1 ACCESSORS

=head2 schedule_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'jobmachine.schedule_schedule_id_seq'

=head2 title

  data_type: 'text'
  is_nullable: 1

=head2 schedule

  data_type: 'text'
  is_nullable: 1

=head2 class_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 method

  data_type: 'text'
  is_nullable: 1

=head2 parameters

  data_type: 'text'
  is_nullable: 1

=head2 updated

  data_type: 'timestamp'
  default_value: current_timestamp
  is_nullable: 0
  original: {default_value => \"now()"}

=cut

__PACKAGE__->add_columns(
  "schedule_id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "jobmachine.schedule_schedule_id_seq",
  },
  "title",
  { data_type => "text", is_nullable => 1 },
  "schedule",
  { data_type => "text", is_nullable => 1 },
  "class_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "method",
  { data_type => "text", is_nullable => 1 },
  "parameters",
  { data_type => "text", is_nullable => 1 },
  "updated",
  {
    data_type     => "timestamp",
    default_value => \"current_timestamp",
    is_nullable   => 0,
    original      => { default_value => \"now()" },
  },
);
__PACKAGE__->set_primary_key("schedule_id");

=head1 RELATIONS

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
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:HiZz60K12hK4cxBDJrtkQg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;

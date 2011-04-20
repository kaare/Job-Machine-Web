package Job::Machine::Schema::Result::Fulltask;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Job::Machine::Schema::Result::Fulltask

=cut

__PACKAGE__->table("jobmachine.fulltask");

=head1 ACCESSORS

=head2 task_id

  data_type: 'integer'
  is_nullable: 1

=head2 status

  data_type: 'integer'
  is_nullable: 1

=head2 parameters

  data_type: 'text'
  is_nullable: 1

=head2 name

  data_type: 'text'
  is_nullable: 1

=head2 result_id

  data_type: 'integer'
  is_nullable: 1

=head2 result

  data_type: 'text'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "task_id",
  { data_type => "integer", is_nullable => 1 },
  "status",
  { data_type => "integer", is_nullable => 1 },
  "parameters",
  { data_type => "text", is_nullable => 1 },
  "name",
  { data_type => "text", is_nullable => 1 },
  "result_id",
  { data_type => "integer", is_nullable => 1 },
  "result",
  { data_type => "text", is_nullable => 1 },
);


# Created by DBIx::Class::Schema::Loader v0.07007 @ 2011-04-13 09:40:17
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:KKMaG9kINg+s1s8V2SC45Q


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;

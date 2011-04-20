package Job::Machine::Schema::Result::Dependency;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Job::Machine::Schema::Result::Dependency

=cut

__PACKAGE__->table("jobmachine.dependency");

=head1 ACCESSORS

=head2 depends

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 depended

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 created

  data_type: 'timestamp'
  default_value: current_timestamp
  is_nullable: 0
  original: {default_value => \"now()"}

=cut

__PACKAGE__->add_columns(
  "depends",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "depended",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "created",
  {
    data_type     => "timestamp",
    default_value => \"current_timestamp",
    is_nullable   => 0,
    original      => { default_value => \"now()" },
  },
);
__PACKAGE__->set_primary_key("depends", "depended");

=head1 RELATIONS

=head2 depend

Type: belongs_to

Related object: L<Job::Machine::Schema::Result::Task>

=cut

__PACKAGE__->belongs_to(
  "depend",
  "Job::Machine::Schema::Result::Task",
  { task_id => "depends" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);

=head2 depended

Type: belongs_to

Related object: L<Job::Machine::Schema::Result::Task>

=cut

__PACKAGE__->belongs_to(
  "depended",
  "Job::Machine::Schema::Result::Task",
  { task_id => "depended" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);


# Created by DBIx::Class::Schema::Loader v0.07007 @ 2011-04-13 09:40:17
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:f2grF4sedKE27DTPwMOSgA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;

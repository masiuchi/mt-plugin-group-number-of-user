package MT::Plugin::GroupNumberOfUser;
use strict;
use warnings;
use base qw( MT::Plugin );

my $plugin = __PACKAGE__->new(
    {   name    => 'GroupNumberOfUser',
        version => 0.01,

        author_name => 'masiuchi',
        author_link => 'https://github.com/masiuchi',
        plugin_link =>
            'https://github.com/masiuchi/mt-plugin-group-number-of-user',
        description =>
            '<__trans phrase="Add group number column in Manage Users screen.">',

        registry => { list_properties => { author => \&_list_properties, }, },
    }
);
MT->add_plugin($plugin);

sub _list_properties {
    return {
        group_number => {
            base  => '__virtual.integer',
            label => 'Group Number',
            html  => sub {
                my ( $prop, $obj ) = @_;
                $obj->group_count;
            },
        },
    };
}

1;

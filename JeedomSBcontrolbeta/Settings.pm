package Plugins::JeedomSBcontrol::Settings;


# SqueezeCenter Copyright 2001-2007 Logitech.
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License,
# version 2.

# Settings file.
# This file contains stuff generally applicable to the web interface used to set the settings for the plugin
# The HelloWorld plugin has a single text field in the settings screen used to enter a name to which to say "Hello."
# Anything in this file is required, except for anything that is clearly HelloWorld specific

# All good/required uses to have in here.
use strict;
use base qw(Slim::Web::Settings);
use Slim::Utils::Prefs;
use Slim::Utils::Log;

# Used for logging.
my $log = Slim::Utils::Log->addLogCategory({
	'category'     => 'plugin.jeedomsbcontrolbeta',
	'defaultLevel' => 'INFO',
#	'defaultLevel' => 'DEBUG',
	'description'  => 'JeedomSBcontrol Beta Settings',
});

# my own debug outputer
sub myDebug {
	my $msg = shift;
	
	$log->info("*** JeedomSBcontrol Beta - Settings *** $msg");
}

my $prefs = preferences('plugin.jeedomsbcontrolbeta');

sub name {
	return Slim::Web::HTTP::CSRF->protectName('PLUGIN_JEEDOMBETA_NAME');
}

sub page {
	return Slim::Web::HTTP::CSRF->protectURI('plugins/Jeedomsbcontrolbeta/settings/basic.html');
}

sub prefs {
	return ($prefs, qw(address user) );
}

1;

__END__
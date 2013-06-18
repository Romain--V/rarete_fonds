#!/usr/bin/perl

use strict;
use warnings;
use multiwhere_comptage;
#use LWP::Simple; # get(url)

# Attention à ne pas mettre de retour à la ligne Windows dans le fichier ISBN : uniquement UNIX


=head1 NAME
rarete.pl
=cut

=head1 DESCRIPTION
A partir d'une liste de PPN, permet de connaître la "rareté" d'un fonds documentaire.
Compte le nombre de localisation de chaque ouvrage.

romain.vanel@ujf-grenoble.fr
rugbis@ujf-grenoble.fr

=cut

=head1 PROJETS

PPN > multiwhere > comptage
sortie dans un fichier > PPN <-> nombre
stock dans un hash
comptage du %tage de chaque nombre. ex : unica 1% ; 2 ex : 3%
ISBN > PPN > programme
connexion aleph


=cut

=head1 UTILISATION




=cut

=head1 LICENCE

GNU/GPL

=cut

#------------------------------------------------------------------------------
# Paramêtres généraux


#==============================================================================
# main

my $fichier_de_base = "ppn" ;

open(FICHIER_DE_BASE, $fichier_de_base) ||
  die "ficher $fichier_de_base introuvable : $!";
  
my @fichier_de_base = <FICHIER_DE_BASE>;
close FICHIER_DE_BASE ;


foreach my $ligne_fichier_de_base (@fichier_de_base) {
	my $nb_loc = multiwhere_comptage::mwhere($ligne_fichier_de_base);
	chomp $ligne_fichier_de_base;
	print "$ligne_fichier_de_base : $nb_loc\n";
}

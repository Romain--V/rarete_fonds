#!/usr/bin/perl
package multiwhere_comptage;
use strict;
use warnings;
use LWP::Simple;	# get(url)


# ~~~~~~~ VERSIONS~~~~~~~~
# 18.06.2013 : Création.
# 
# ~~~~~~~ VERSIONS~~~~~~~~
#
# romain.vanel@gmail.com
# rugbis@ujf-grenoble.fr



=head1 NAME
multiwhere_comptage.pm
=cut

=head1 DESCRIPTION
Package d'interogation du webservice Multiwhere.
A partir de multiwhere (Abes), le nombre de (RCR) localisés sous une notice du Sudoc (PPN)

=cut

=head1 UTILISATION


=cut

=head1 LICENCE

GNU/GPL

=cut



#------------------------------------------------------------------------------
sub mwhere {

my ($ppn_a_localiser) = @_ ;


#URL Abes Multiwhere
my $url_abes_multiwhere_basique = "http://www.sudoc.fr/services/multiwhere/";



my $ppn_2 = $ppn_a_localiser;
  chomp($ppn_2);
my $url = &url_generator($ppn_a_localiser,$url_abes_multiwhere_basique);
my $page_multiwhere = &downloader_de_page($url,$ppn_2);

 if ($page_multiwhere) {
    my $nombre = &chercheur_de_rcr($page_multiwhere);
    return $nombre;
  }
  else {
    return "Erreur, mauvais PPN : $ppn_2";
  } ;
}

#------------------------------------------------------------------------------
sub url_generator {
  my ($ppn_a_chercher, $url_basique) = @_;
  chomp($url_basique);
  my $url_construite = "$url_basique$ppn_a_chercher\n" ;
  return $url_construite;
}

#------------------------------------------------------------------------------
sub downloader_de_page {
  my ($url,$ppn2) = @_ ;
  if (my $page = get($url)) {
   return $page;
}
    else {
      return 0;
    };

}


#------------------------------------------------------------------------------
sub chercheur_de_rcr {
   my ($notice_localisation) = @_ ;
   my $count =()= $notice_localisation =~ m{</rcr>}g;
   return $count;
  
}
  
1;

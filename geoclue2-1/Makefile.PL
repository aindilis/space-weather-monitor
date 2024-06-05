use ExtUtils::MakeMaker;

WriteMakefile(
	      NAME         => 'Geo::Coder::GeoClue2::Manager',
	      VERSION_FROM => 'Geo/Coder/GeoClue2/Manager.pm',
	      LIBS         => ['-lgeoclue-2'],
	      INC          => '-I/usr/include/geoclue-2.0',
	      OBJECT       => '$(O_FILES)',
	      AUTHOR       => 'Your Name',
	      LICENSE      => 'perl',
	     );

#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#include <glib.h>
#include <geoclue.h>

MODULE = Geo::Coder::GeoClue2::Manager  PACKAGE = Geo::Coder::GeoClue2::Manager

PROTOTYPES: DISABLE

TYPEMAP
GeoclueManager* T_PTROBJ_SPECIAL
GeoclueClient*  T_PTROBJ_SPECIAL

INPUT
T_PTROBJ_SPECIAL
    if (sv_derived_from($arg, \"Geo::Coder::GeoClue2::Manager\")) {
        IV tmp = SvIV((SV*)SvRV($arg));
        $var = INT2PTR($type, tmp);
    }
    else
        croak(\"$var is not of type Geo::Coder::GeoClue2::Manager\")

OUTPUT
T_PTROBJ_SPECIAL
    sv_setref_pv($arg, \"Geo::Coder::GeoClue2::Manager\", (void*)$var);

GeoclueManager*
get_default()
    CODE:
        GeoclueMaster *master = geoclue_master_get_default();
        RETVAL = master;
    OUTPUT:
        RETVAL

GeoclueClient*
get_client(manager, desktop_id)
    GeoclueManager* manager
    const char* desktop_id
    CODE:
        GeoclueClient *client = geoclue_master_create_client(manager, desktop_id, NULL, NULL);
        RETVAL = client;
    OUTPUT:
        RETVAL

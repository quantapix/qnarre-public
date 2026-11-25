













import Proving.USC.T42.PublicAccommodations.Entitlement.Elements.Predicates
import Proving.USC.Common.Predicates

namespace Proving.USC.T42.PublicAccommodations.Entitlement.Elements

open Proving.USC.Common





structure PlaceOfPublicAccommodation
    (e : Establishment) (c : ComplaintText) : Prop where
  enumerated : IsEnumeratedEstablishment e c
  notExempt  : NotExemptPrivateClub e c




structure Section2000aCommerce
    (p : Person) (e : Establishment) (c : ComplaintText) : Prop where
  covered     : PlaceOfPublicAccommodation e c
  commerce    : OperationsAffectCommerce e c
  denied      : DeniedFullAndEqualEnjoyment p e c
  onGround    : DiscriminatedOnProhibitedGround p e c



structure Section2000aStateAction
    (p : Person) (e : Establishment) (c : ComplaintText) : Prop where
  covered     : PlaceOfPublicAccommodation e c
  stateAction : DiscriminationSupportedByStateAction e c
  denied      : DeniedFullAndEqualEnjoyment p e c
  onGround    : DiscriminatedOnProhibitedGround p e c




inductive Section2000aViolation
    (p : Person) (e : Establishment) (c : ComplaintText) : Prop where
  | commerce    (h : Section2000aCommerce p e c)    : Section2000aViolation p e c
  | stateAction (h : Section2000aStateAction p e c) : Section2000aViolation p e c






structure ValidTitleIIPublicAccommodationClaim
    (p : Person) (e : Establishment) (c : ComplaintText) : Prop where
  violation : Section2000aViolation p e c
  inUS      : IsPersonInUS p c
  aggrieved : IsPersonAggrieved p c
  relief    : SeeksPreventiveRelief p c
  notice    : GaveStatePresuitNotice p c
  timely    : WithinLimitations p c

end Proving.USC.T42.PublicAccommodations.Entitlement.Elements

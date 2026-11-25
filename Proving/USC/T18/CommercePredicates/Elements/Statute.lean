







import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T18.CommercePredicates.Elements.Types
import Proving.USC.T18.CommercePredicates.Elements.Predicates

namespace Proving.USC.T18.CommercePredicates.Elements

open Proving.USC.Common





inductive JurisdictionalMeans1958 (p : Person) (f : CommerceFacility) (c : ComplaintText) : Prop where
  | travel   (h : TraveledInInterstateCommerce p c)        : JurisdictionalMeans1958 p f c
  | facility (h : UsedInterstateCommerceFacility f c)        : JurisdictionalMeans1958 p f c



structure Section1958Completed (p : Person) (f : CommerceFacility) (c : ComplaintText) : Prop where
  means         : JurisdictionalMeans1958 p f c
  intent        : IntentThatMurderCommitted p c
  consideration : AsConsiderationForPecuniaryValue p c



inductive ValidSection1958Charge (p : Person) (f : CommerceFacility) (c : ComplaintText) : Prop where
  | completed (h : Section1958Completed p f c)        : ValidSection1958Charge p f c
  | conspiracy (h : ConspiredToCommitMurderForHire p c) : ValidSection1958Charge p f c






inductive UnlicensedRoute1960 (b : MoneyTransmittingBusiness) (c : ComplaintText) : Prop where
  | noStateLicense (h : OperatedWithoutStateLicense b c)      : UnlicensedRoute1960 b c
  | noRegistration (h : FailsSection5330Registration b c)      : UnlicensedRoute1960 b c
  | criminalFunds  (h : InvolvesCriminallyDerivedFunds b c)    : UnlicensedRoute1960 b c





structure Section1960 (p : Person) (b : MoneyTransmittingBusiness) (e : Entity) (c : ComplaintText) : Prop where
  knowingConduct : KnowinglyConductsMTB p b c
  isMTB          : IsMoneyTransmittingBusiness b c
  commerce       : EngagedInInterstateCommerce e c
  unlicensed     : UnlicensedRoute1960 b c

end Proving.USC.T18.CommercePredicates.Elements

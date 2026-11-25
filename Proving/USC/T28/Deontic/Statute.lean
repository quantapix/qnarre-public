import Proving.USC.T28.Deontic.Types
import Proving.USC.T28.Deontic.Predicates
import Proving.USC.Common.Types

namespace Proving.USC.T28.Deontic

open Proving.USC.Common





inductive JurisdictionalBasis1343 (a : CivilAction) (c : ComplaintText) : Prop where
  | conspiracyInjury  : ConspiracyInjuryClaim1343a1 a c → JurisdictionalBasis1343 a c
  | neglectToPrevent  : NeglectToPreventClaim1343a2 a c → JurisdictionalBasis1343 a c
  | colorOfLaw        : ColorOfLawDeprivationClaim1343a3 a c → JurisdictionalBasis1343 a c
  | civilRightsRelief : CivilRightsReliefClaim1343a4 a c → JurisdictionalBasis1343 a c







structure Power1343a (ct : Court) (p : Person) (a : CivilAction) (c : ComplaintText) : Prop where
  addressee  : AddresseeIsDistrictCourt ct c
  authorized : CivilActionAuthorizedByLaw a c
  commenced  : CommencedByPerson p a c
  basis      : JurisdictionalBasis1343 a c








structure Permission1746 (m : Matter) (c : ComplaintText) : Prop where
  condition   : MatterRequiresSwornSupport1746 m c
  notExcepted : OutsideExceptedCategories1746 m c



inductive PrescribedForm1746 (d : Declaration) (c : ComplaintText) : Prop where
  | withoutUS : PrescribedFormWithoutUS1746 d c → PrescribedForm1746 d c
  | withinUS  : PrescribedFormWithinUS1746 d c → PrescribedForm1746 d c




def UnswornDeclarationEffective1746 (p : Person) (m : Matter) (d : Declaration) (c : ComplaintText) : Prop :=
  Permission1746 m c ∧
  UnswornWrittenDeclarationMade1746 p m d c ∧
  SubscribedTrueUnderPenaltyOfPerjury p d c ∧
  DeclarationDated1746 d c ∧
  PrescribedForm1746 d c

end Proving.USC.T28.Deontic

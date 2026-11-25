import Proving.USC.T28.Deontic.Types
import Proving.USC.Common.Types
import Proving.USC.Common.Predicates

namespace Proving.USC.T28.Deontic

open Proving.USC.Common





axiom AddresseeIsDistrictCourt (ct : Court) (c : ComplaintText) : Prop



axiom CivilActionAuthorizedByLaw (a : CivilAction) (c : ComplaintText) : Prop



axiom CommencedByPerson (p : Person) (a : CivilAction) (c : ComplaintText) : Prop





axiom ConspiracyInjuryClaim1343a1 (a : CivilAction) (c : ComplaintText) : Prop





axiom NeglectToPreventClaim1343a2 (a : CivilAction) (c : ComplaintText) : Prop





axiom ColorOfLawDeprivationClaim1343a3 (a : CivilAction) (c : ComplaintText) : Prop




axiom CivilRightsReliefClaim1343a4 (a : CivilAction) (c : ComplaintText) : Prop





axiom DcConsideredState1343b (c : ComplaintText) : Prop








axiom MatterRequiresSwornSupport1746 (m : Matter) (c : ComplaintText) : Prop





axiom OutsideExceptedCategories1746 (m : Matter) (c : ComplaintText) : Prop





axiom UnswornWrittenDeclarationMade1746 (p : Person) (m : Matter) (d : Declaration) (c : ComplaintText) : Prop




axiom SubscribedTrueUnderPenaltyOfPerjury (p : Person) (d : Declaration) (c : ComplaintText) : Prop



axiom DeclarationDated1746 (d : Declaration) (c : ComplaintText) : Prop





axiom PrescribedFormWithoutUS1746 (d : Declaration) (c : ComplaintText) : Prop




axiom PrescribedFormWithinUS1746 (d : Declaration) (c : ComplaintText) : Prop

end Proving.USC.T28.Deontic

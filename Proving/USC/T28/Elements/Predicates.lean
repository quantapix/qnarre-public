import Proving.USC.T28.Elements.Types
import Proving.USC.Common.Types
import Proving.USC.Common.Predicates

namespace Proving.USC.T28.Elements
open Proving.USC.Common












axiom CivilActionAuthorizedByLaw (a : CivilAction) (c : ComplaintText) : Prop





axiom InjuryToPersonOrProperty (a : CivilAction) (c : ComplaintText) : Prop




axiom DeprivationOfCitizenRightOrPrivilege (a : CivilAction) (c : ComplaintText) : Prop




axiom ActInFurtheranceOfSection1985Conspiracy (a : CivilAction) (c : ComplaintText) : Prop



axiom SeeksDamages (a : CivilAction) (c : ComplaintText) : Prop






axiom KnewOfImpendingSection1985Wrongs (p : Person) (c : ComplaintText) : Prop



axiom HadPowerToPrevent (p : Person) (c : ComplaintText) : Prop




axiom FailedToPreventOrAidInPreventing (p : Person) (c : ComplaintText) : Prop






axiom DeprivationOfRightPrivilegeOrImmunity (a : CivilAction) (c : ComplaintText) : Prop




axiom RightSecuredByConstitution (a : CivilAction) (c : ComplaintText) : Prop





axiom RightSecuredByEqualRightsAct (a : CivilAction) (c : ComplaintText) : Prop






axiom ClaimUnderCivilRightsProtectionAct (a : CivilAction) (c : ComplaintText) : Prop




axiom SeeksDamagesOrEquitableOrOtherRelief (a : CivilAction) (c : ComplaintText) : Prop








axiom MatterRequiresOrPermitsSwornSupport (d : Declaration) (c : ComplaintText) : Prop






axiom ExceptedSwornMatter (d : Declaration) (c : ComplaintText) : Prop




axiom IsWrittenDeclaration (d : Declaration) (c : ComplaintText) : Prop




axiom SubscribedAsTrueUnderPenaltyOfPerjury (d : Declaration) (c : ComplaintText) : Prop



axiom IsDated (d : Declaration) (c : ComplaintText) : Prop



axiom ExecutedOutsideUS (d : Declaration) (c : ComplaintText) : Prop




axiom ExecutedWithinUS (d : Declaration) (c : ComplaintText) : Prop





axiom UsesSubstantiallyPrescribedForeignForm (d : Declaration) (c : ComplaintText) : Prop




axiom UsesSubstantiallyPrescribedDomesticForm (d : Declaration) (c : ComplaintText) : Prop

end Proving.USC.T28.Elements

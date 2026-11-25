import Proving.USC.T28.Elements.Types
import Proving.USC.T28.Elements.Predicates
import Proving.USC.Common.Types
import Proving.USC.Common.Predicates

namespace Proving.USC.T28.Elements
open Proving.USC.Common











inductive Injury1343a1 (a : CivilAction) (c : ComplaintText) : Prop where
  | personalOrProperty (h : InjuryToPersonOrProperty a c)
  | citizenDeprivation (h : DeprivationOfCitizenRightOrPrivilege a c)



structure Section1343a1 (a : CivilAction) (c : ComplaintText) : Prop where
  authorized  : CivilActionAuthorizedByLaw a c
  damages     : SeeksDamages a c
  injury      : Injury1343a1 a c
  furtherance : ActInFurtheranceOfSection1985Conspiracy a c






structure Section1343a2 (p : Person) (a : CivilAction) (c : ComplaintText) : Prop where
  authorized : CivilActionAuthorizedByLaw a c
  damages    : SeeksDamages a c
  knowledge  : KnewOfImpendingSection1985Wrongs p c
  power      : HadPowerToPrevent p c
  failure    : FailedToPreventOrAidInPreventing p c






inductive SecuredRightSource1343a3 (a : CivilAction) (c : ComplaintText) : Prop where
  | constitution (h : RightSecuredByConstitution a c)
  | equalRightsAct (h : RightSecuredByEqualRightsAct a c)






structure Section1343a3 (p : Person) (a : CivilAction) (c : ComplaintText) : Prop where
  authorized  : CivilActionAuthorizedByLaw a c
  deprivation : DeprivationOfRightPrivilegeOrImmunity a c
  source      : SecuredRightSource1343a3 a c
  colorOfLaw  : ActsUnderColorOfStateLaw p c





structure Section1343a4 (a : CivilAction) (c : ComplaintText) : Prop where
  authorized    : CivilActionAuthorizedByLaw a c
  claimUnderAct : ClaimUnderCivilRightsProtectionAct a c
  relief        : SeeksDamagesOrEquitableOrOtherRelief a c




inductive Section1343Jurisdiction (p : Person) (a : CivilAction) (c : ComplaintText) : Prop where
  | a1 (h : Section1343a1 a c)
  | a2 (h : Section1343a2 p a c)
  | a3 (h : Section1343a3 p a c)
  | a4 (h : Section1343a4 a c)






inductive FormCompliance1746 (d : Declaration) (c : ComplaintText) : Prop where
  | outsideUS (hLoc : ExecutedOutsideUS d c)
      (hForm : UsesSubstantiallyPrescribedForeignForm d c)
  | withinUS (hLoc : ExecutedWithinUS d c)
      (hForm : UsesSubstantiallyPrescribedDomesticForm d c)





structure Section1746Declaration (d : Declaration) (c : ComplaintText) : Prop where
  applicability : MatterRequiresOrPermitsSwornSupport d c
  notExcepted   : ¬ ExceptedSwornMatter d c
  written       : IsWrittenDeclaration d c
  subscribed    : SubscribedAsTrueUnderPenaltyOfPerjury d c
  dated         : IsDated d c
  form          : FormCompliance1746 d c

end Proving.USC.T28.Elements

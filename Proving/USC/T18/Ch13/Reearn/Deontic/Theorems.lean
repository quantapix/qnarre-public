











import Proving.USC.T18.Ch13.Reearn.Deontic.Types
import Proving.USC.T18.Ch13.Reearn.Deontic.Predicates
import Proving.USC.T18.Ch13.Reearn.Deontic.Statute
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch13.Reearn.Deontic

open Proving.USC.Common



theorem prohibition245a1_intro (pr : Prosecution) (c : ComplaintText)
    (hAddr : AddresseeIsUnitedStatesProsecutor245a1 pr c)
    (hUncert : ¬ CertificationRequirementSatisfied245a1 pr c) :
    Prohibition245a1 pr c :=
  ⟨hAddr, hUncert⟩

theorem prohibitionViolated245a1_intro (pr : Prosecution) (c : ComplaintText)
    (hAddr : AddresseeIsUnitedStatesProsecutor245a1 pr c)
    (hUncert : ¬ CertificationRequirementSatisfied245a1 pr c)
    (hAct : RegulatedActOccurred245a1 pr c) :
    ProhibitionViolated245a1 pr c :=
  ⟨⟨hAddr, hUncert⟩, hAct⟩



theorem power245a2_intro (p : Person) (c : ComplaintText)
    (hAddr : AddresseeIsFederalInvestigator245a2 p c)
    (hAct : InvestigationOfSuspectedViolation245a2 p c) :
    Power245a2 p c :=
  ⟨hAddr, hAct⟩



theorem conditionMet245b_intro_federalNexus (v : Person) (a : ProtectedActivity)
    (c : ComplaintText) (h : FederalElectoralOrBenefitNexus245b1 v a c) :
    ConditionMet245b v a c :=
  .federalNexus h

theorem conditionMet245b_intro_protectedStatus (v : Person) (a : ProtectedActivity)
    (c : ComplaintText) (h : RacialOrReligiousStatusNexus245b2 v a c) :
    ConditionMet245b v a c :=
  .protectedStatus h

theorem conditionMet245b_intro_riotCommerce (v : Person) (a : ProtectedActivity)
    (c : ComplaintText) (h : RiotOrCivilDisorderCommerceNexus245b3 v a c) :
    ConditionMet245b v a c :=
  .riotCommerce h

theorem conditionMet245b_intro_participation (v : Person) (a : ProtectedActivity)
    (c : ComplaintText) (h : NondiscriminatoryParticipationNexus245b4 v a c) :
    ConditionMet245b v a c :=
  .participation h

theorem conditionMet245b_intro_citizenEncouragement (v : Person) (a : ProtectedActivity)
    (c : ComplaintText) (h : CitizenEncouragementNexus245b5 v a c) :
    ConditionMet245b v a c :=
  .citizenEncouragement h

theorem prohibition245b_intro (p : Person) (v : Person) (a : ProtectedActivity)
    (c : ComplaintText)
    (hAddr : AddresseeInClass245b p c) (hCond : ConditionMet245b v a c) :
    Prohibition245b p v a c :=
  ⟨hAddr, hCond⟩

theorem prohibitionViolated245b_intro (p : Person) (v : Person) (a : ProtectedActivity)
    (c : ComplaintText)
    (hAddr : AddresseeInClass245b p c) (hCond : ConditionMet245b v a c)
    (hAct : RegulatedActOccurred245b p v c)
    (hNoLeo : ¬ LawEnforcementDutyExemption245c p c)
    (hNoLodging : ¬ SmallLodgingProprietorExemption245b p a c) :
    ProhibitionViolated245b p v a c :=
  ⟨⟨hAddr, hCond⟩, hAct, hNoLeo, hNoLodging⟩



theorem regulatedAct247a_intro_propertyDamage (p : Person) (v : Person)
    (rp : ReligiousProperty) (c : ComplaintText)
    (h : RegulatedActOccurred247a1 p rp c) : RegulatedAct247a p v rp c :=
  .propertyDamage h

theorem regulatedAct247a_intro_freeExerciseObstruction (p : Person) (v : Person)
    (rp : ReligiousProperty) (c : ComplaintText)
    (h : RegulatedActOccurred247a2 p v c) : RegulatedAct247a p v rp c :=
  .freeExerciseObstruction h

theorem prohibition247a_intro (p : Person) (c : ComplaintText)
    (hAddr : AddresseeInClass247a p c)
    (hCommerce : InterstateOrForeignCommerceCircumstance247b c) :
    Prohibition247a p c :=
  ⟨hAddr, hCommerce⟩

theorem prohibitionViolated247a_intro (p : Person) (v : Person)
    (rp : ReligiousProperty) (c : ComplaintText)
    (hAddr : AddresseeInClass247a p c)
    (hCommerce : InterstateOrForeignCommerceCircumstance247b c)
    (hAct : RegulatedAct247a p v rp c) :
    ProhibitionViolated247a p v rp c :=
  ⟨⟨hAddr, hCommerce⟩, hAct⟩



theorem prohibition247c_intro (p : Person) (c : ComplaintText)
    (hAddr : AddresseeInClass247c p c) : Prohibition247c p c :=
  ⟨hAddr⟩

theorem prohibitionViolated247c_intro (p : Person) (rp : ReligiousProperty)
    (c : ComplaintText)
    (hAddr : AddresseeInClass247c p c)
    (hAct : RegulatedActOccurred247c p rp c) :
    ProhibitionViolated247c p rp c :=
  ⟨⟨hAddr⟩, hAct⟩



theorem prohibition247e_intro (pr : Prosecution) (c : ComplaintText)
    (hAddr : AddresseeIsUnitedStatesProsecutor247e pr c)
    (hUncert : ¬ CertificationRequirementSatisfied247e pr c) :
    Prohibition247e pr c :=
  ⟨hAddr, hUncert⟩

theorem prohibitionViolated247e_intro (pr : Prosecution) (c : ComplaintText)
    (hAddr : AddresseeIsUnitedStatesProsecutor247e pr c)
    (hUncert : ¬ CertificationRequirementSatisfied247e pr c)
    (hAct : RegulatedActOccurred247e pr c) :
    ProhibitionViolated247e pr c :=
  ⟨⟨hAddr, hUncert⟩, hAct⟩



theorem prohibition247g_intro (pr : Prosecution) (c : ComplaintText)
    (hUntimely : ¬ ChargedWithinSevenYears247g pr c) : Prohibition247g pr c :=
  ⟨hUntimely⟩

theorem prohibitionViolated247g_intro (pr : Prosecution) (c : ComplaintText)
    (hUntimely : ¬ ChargedWithinSevenYears247g pr c)
    (hAct : NoncapitalProsecutionUndertaken247g pr c) :
    ProhibitionViolated247g pr c :=
  ⟨⟨hUntimely⟩, hAct⟩



theorem regulatedAct248a_intro_reproductiveHealth (p : Person) (v : Person)
    (f : Facility) (c : ComplaintText)
    (h : ReproductiveHealthServicesInterference248a1 p v c) :
    RegulatedAct248a p v f c :=
  .reproductiveHealth h

theorem regulatedAct248a_intro_religiousExercise (p : Person) (v : Person)
    (f : Facility) (c : ComplaintText)
    (h : ReligiousExerciseInterference248a2 p v c) :
    RegulatedAct248a p v f c :=
  .religiousExercise h

theorem regulatedAct248a_intro_propertyDamage (p : Person) (v : Person)
    (f : Facility) (c : ComplaintText)
    (h : ProtectedPropertyDamage248a3 p f c) :
    RegulatedAct248a p v f c :=
  .propertyDamage h

theorem prohibition248a_intro (p : Person) (c : ComplaintText)
    (hAddr : AddresseeInClass248a p c) : Prohibition248a p c :=
  ⟨hAddr⟩

theorem prohibitionViolated248a_intro (p : Person) (v : Person) (f : Facility)
    (c : ComplaintText)
    (hAddr : AddresseeInClass248a p c)
    (hAct : RegulatedAct248a p v f c)
    (hNoParent : ¬ ParentalGuardianExemption248a p v c)
    (hNoFirstAmendment : ¬ FirstAmendmentProtectedExpressiveConduct248d1 p c) :
    ProhibitionViolated248a p v f c :=
  ⟨⟨hAddr⟩, hAct, hNoParent, hNoFirstAmendment⟩



theorem permission248c1_intro (v : Person) (c : ComplaintText)
    (hAggrieved : AggrievedByProhibitedConduct248c1 v c)
    (hStanding : StandingLimitationSatisfied248c1 v c) :
    Permission248c1 v c :=
  ⟨hAggrieved, hStanding⟩

theorem permissionExercised248c1_intro (v : Person) (ca : CivilAction) (c : ComplaintText)
    (hAggrieved : AggrievedByProhibitedConduct248c1 v c)
    (hStanding : StandingLimitationSatisfied248c1 v c)
    (hCommenced : CivilActionCommenced248c1 v ca c) :
    PermissionExercised248c1 v ca c :=
  ⟨⟨hAggrieved, hStanding⟩, hCommenced⟩

theorem power248c1b_intro (ca : CivilAction) (c : ComplaintText)
    (hCourt : AdjudicatingCourtInAction248c1b ca c)
    (hRelief : ReliefAwardAuthorized248c1b ca c) :
    Power248c1b ca c :=
  ⟨hCourt, hRelief⟩

theorem power248c2_intro (c : ComplaintText)
    (hCause : AttorneyGeneralReasonableCause248c2 c) : Power248c2 c :=
  ⟨hCause⟩

theorem powerExercised248c2_intro (ca : CivilAction) (c : ComplaintText)
    (hCause : AttorneyGeneralReasonableCause248c2 c)
    (hCommenced : UnitedStatesCivilActionCommenced248c2 ca c) :
    PowerExercised248c2 ca c :=
  ⟨⟨hCause⟩, hCommenced⟩

theorem power248c3_intro (c : ComplaintText)
    (hCause : StateAttorneyGeneralReasonableCause248c3 c) : Power248c3 c :=
  ⟨hCause⟩

theorem powerExercised248c3_intro (ca : CivilAction) (c : ComplaintText)
    (hCause : StateAttorneyGeneralReasonableCause248c3 c)
    (hCommenced : StateParensPatriaeActionCommenced248c3 ca c) :
    PowerExercised248c3 ca c :=
  ⟨⟨hCause⟩, hCommenced⟩






theorem lawEnforcementDutyExemption245c_precludes_violation245b
    (p : Person) (v : Person) (a : ProtectedActivity) (c : ComplaintText)
    (hExempt : LawEnforcementDutyExemption245c p c) :
    ¬ ProhibitionViolated245b p v a c :=
  fun h => h.2.2.1 hExempt




theorem smallLodgingProprietorExemption245b_precludes_violation245b
    (p : Person) (v : Person) (a : ProtectedActivity) (c : ComplaintText)
    (hExempt : SmallLodgingProprietorExemption245b p a c) :
    ¬ ProhibitionViolated245b p v a c :=
  fun h => h.2.2.2 hExempt




theorem parentalGuardianExemption248a_precludes_violation248a
    (p : Person) (v : Person) (f : Facility) (c : ComplaintText)
    (hExempt : ParentalGuardianExemption248a p v c) :
    ¬ ProhibitionViolated248a p v f c :=
  fun h => h.2.2.1 hExempt




theorem firstAmendmentProtection248d1_precludes_violation248a
    (p : Person) (v : Person) (f : Facility) (c : ComplaintText)
    (hProtected : FirstAmendmentProtectedExpressiveConduct248d1 p c) :
    ¬ ProhibitionViolated248a p v f c :=
  fun h => h.2.2.2 hProtected



theorem certification245a1_precludes_violation245a1
    (pr : Prosecution) (c : ComplaintText)
    (hCert : CertificationRequirementSatisfied245a1 pr c) :
    ¬ ProhibitionViolated245a1 pr c :=
  fun h => h.1.uncertified hCert



theorem certification247e_precludes_violation247e
    (pr : Prosecution) (c : ComplaintText)
    (hCert : CertificationRequirementSatisfied247e pr c) :
    ¬ ProhibitionViolated247e pr c :=
  fun h => h.1.uncertified hCert



theorem timelyCharging247g_precludes_violation247g
    (pr : Prosecution) (c : ComplaintText)
    (hTimely : ChargedWithinSevenYears247g pr c) :
    ¬ ProhibitionViolated247g pr c :=
  fun h => h.1.untimely hTimely

end Proving.USC.T18.Ch13.Reearn.Deontic

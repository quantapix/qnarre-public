






import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T18.Ch13.Reearn.Scienter.Types
import Proving.USC.T18.Ch13.Reearn.Scienter.Predicates
import Proving.USC.T18.Ch13.Reearn.Scienter.Statute

set_option autoImplicit false

namespace Proving.USC.T18.Ch13.Reearn.Scienter

open Proving.USC.Common







theorem demandMet_of_provenRung {p : Person} {l : ScienterLocus} {c : ComplaintText}
    (req rung : MentalState) (hreach : rung.atLeast req)
    (hp : MentalStateProvenAt p l rung c) : demandMet p l c (.requires req) := by
  cases req <;> first | exact True.intro | exact ⟨rung, hreach, hp⟩




theorem demandSatisfied_intro {p : Person} {l : ScienterLocus} {c : ComplaintText}
    {req rung : MentalState} (hreq : requiredDemand l = .requires req)
    (hreach : rung.atLeast req) (hp : MentalStateProvenAt p l rung c) :
    DemandSatisfied p l c := by
  unfold DemandSatisfied
  rw [hreq]
  exact demandMet_of_provenRung req rung hreach hp



theorem demandSatisfied_of_strictLiability {p : Person} {l : ScienterLocus}
    {c : ComplaintText} (hreq : requiredDemand l = .requires .StrictLiability) :
    DemandSatisfied p l c := by
  unfold DemandSatisfied
  rw [hreq]
  exact True.intro



theorem demandSatisfied_of_unclassified {p : Person} {l : ScienterLocus}
    {c : ComplaintText} (hreq : requiredDemand l = .unspecified)
    (h : UnclassifiedDemandMet p l c) : DemandSatisfied p l c := by
  unfold DemandSatisfied
  rw [hreq]
  exact h







theorem s245b3_targetSelection_needsNoMentalState {p : Person} {c : ComplaintText} :
    DemandSatisfied p .s245b3_targetSelection c :=
  demandSatisfied_of_strictLiability rfl


theorem s245b_resultEnhancement_needsNoMentalState {p : Person} {c : ComplaintText} :
    DemandSatisfied p .s245b_resultEnhancement c :=
  demandSatisfied_of_strictLiability rfl


theorem s247b_commerceNexus_needsNoMentalState {p : Person} {c : ComplaintText} :
    DemandSatisfied p .s247b_commerceNexus c :=
  demandSatisfied_of_strictLiability rfl


theorem s247d_resultEnhancement_needsNoMentalState {p : Person} {c : ComplaintText} :
    DemandSatisfied p .s247d_resultEnhancement c :=
  demandSatisfied_of_strictLiability rfl


theorem s248b_resultEnhancement_needsNoMentalState {p : Person} {c : ComplaintText} :
    DemandSatisfied p .s248b_resultEnhancement c :=
  demandSatisfied_of_strictLiability rfl


theorem s248b_recidivism_needsNoMentalState {p : Person} {c : ComplaintText} :
    DemandSatisfied p .s248b_recidivism c :=
  demandSatisfied_of_strictLiability rfl






theorem scienter245bChapeau_intro {p : Person} {c : ComplaintText}
    (willfulForce : DemandSatisfied p .s245b_forceConduct c)
    (notLawfulOfficerDuty : ¬ LawEnforcementLawfulDutyExclusion p c) :
    Scienter245bChapeau p c :=
  ⟨willfulForce, notLawfulOfficerDuty⟩


theorem scienter245bBranchDemand_intro {p : Person} {l : ScienterLocus}
    {c : ComplaintText} (isBranch : is245bBranch l = true)
    (branchDemand : DemandSatisfied p l c) : Scienter245bBranchDemand p l c :=
  ⟨isBranch, branchDemand⟩



theorem scienter245b3BranchDemand_free {p : Person} {c : ComplaintText} :
    Scienter245bBranchDemand p .s245b3_targetSelection c :=
  ⟨rfl, s245b3_targetSelection_needsNoMentalState⟩


theorem scienter245b_federalActivity_intro {p : Person} {c : ComplaintText}
    (chapeau : Scienter245bChapeau p c)
    (motive : Scienter245bBranchDemand p .s245b1_motive c) : Scienter245b p c :=
  .federalActivity chapeau motive


theorem scienter245b_protectedClassActivity_intro {p : Person} {c : ComplaintText}
    (chapeau : Scienter245bChapeau p c)
    (classMotive : Scienter245bBranchDemand p .s245b2_protectedClassMotive c)
    (activityMotive : Scienter245bBranchDemand p .s245b2_activityMotive c) :
    Scienter245b p c :=
  .protectedClassActivity chapeau classMotive activityMotive


theorem scienter245b_riotCommercialTarget_intro {p : Person} {c : ComplaintText}
    (chapeau : Scienter245bChapeau p c)
    (target : Scienter245bBranchDemand p .s245b3_targetSelection c) :
    Scienter245b p c :=
  .riotCommercialTarget chapeau target


theorem scienter245b_nondiscriminatoryParticipation_intro {p : Person}
    {c : ComplaintText} (chapeau : Scienter245bChapeau p c)
    (motive : Scienter245bBranchDemand p .s245b4_motive c) : Scienter245b p c :=
  .nondiscriminatoryParticipation chapeau motive


theorem scienter245b_citizenAiding_intro {p : Person} {c : ComplaintText}
    (chapeau : Scienter245bChapeau p c)
    (motive : Scienter245bBranchDemand p .s245b5_motive c) : Scienter245b p c :=
  .citizenAiding chapeau motive


theorem scienter245aCertification_intro {p : Person} {c : ComplaintText}
    (certifyingJudgment : DemandSatisfied p .s245a1_certification c) :
    Scienter245aCertification p c :=
  ⟨certifyingJudgment⟩






theorem scienter247a1_intro {p : Person} {c : ComplaintText}
    (intentionalDamage : DemandSatisfied p .s247a1_conduct c)
    (religiousCharacterMotive : DemandSatisfied p .s247a1_religiousCharacterMotive c)
    (commerceCircumstance : DemandSatisfied p .s247b_commerceNexus c) :
    Scienter247a1 p c :=
  ⟨intentionalDamage, religiousCharacterMotive, commerceCircumstance⟩


theorem scienter247a2_intro {p : Person} {c : ComplaintText}
    (intentionalObstruction : DemandSatisfied p .s247a2_conduct c)
    (commerceCircumstance : DemandSatisfied p .s247b_commerceNexus c) :
    Scienter247a2 p c :=
  ⟨intentionalObstruction, commerceCircumstance⟩


theorem scienter247c_intro {p : Person} {c : ComplaintText}
    (intentionalDamage : DemandSatisfied p .s247c_conduct c)
    (protectedClassMotive : DemandSatisfied p .s247c_protectedClassMotive c) :
    Scienter247c p c :=
  ⟨intentionalDamage, protectedClassMotive⟩


theorem scienter247_religiousPropertyDamage_intro {p : Person} {c : ComplaintText}
    (h : Scienter247a1 p c) : Scienter247 p c :=
  .religiousPropertyDamage h


theorem scienter247_freeExerciseObstruction_intro {p : Person} {c : ComplaintText}
    (h : Scienter247a2 p c) : Scienter247 p c :=
  .freeExerciseObstruction h


theorem scienter247_raceMotivatedPropertyDamage_intro {p : Person} {c : ComplaintText}
    (h : Scienter247c p c) : Scienter247 p c :=
  .raceMotivatedPropertyDamage h


theorem scienter247eCertification_intro {p : Person} {c : ComplaintText}
    (certifyingJudgment : DemandSatisfied p .s247e_certification c) :
    Scienter247eCertification p c :=
  ⟨certifyingJudgment⟩






theorem scienter248a1_intro {p : Person} {c : ComplaintText}
    (intentionalInterference : DemandSatisfied p .s248a1_conduct c)
    (servicesMotive : DemandSatisfied p .s248a1_reproductiveServicesMotive c)
    (notParentalGuardian : ¬ ParentalGuardianExclusion p c) : Scienter248a1 p c :=
  ⟨intentionalInterference, servicesMotive, notParentalGuardian⟩


theorem scienter248a2_intro {p : Person} {c : ComplaintText}
    (intentionalInterference : DemandSatisfied p .s248a2_conduct c)
    (notParentalGuardian : ¬ ParentalGuardianExclusion p c) : Scienter248a2 p c :=
  ⟨intentionalInterference, notParentalGuardian⟩


theorem scienter248a3Facility_intro {p : Person} {c : ComplaintText}
    (intentionalDamage : DemandSatisfied p .s248a3_conduct c)
    (facilityMotive : DemandSatisfied p .s248a3_facilityMotive c)
    (notParentalGuardian : ¬ ParentalGuardianExclusion p c) :
    Scienter248a3Facility p c :=
  ⟨intentionalDamage, facilityMotive, notParentalGuardian⟩


theorem scienter248a3Worship_intro {p : Person} {c : ComplaintText}
    (intentionalDamage : DemandSatisfied p .s248a3_conduct c)
    (notParentalGuardian : ¬ ParentalGuardianExclusion p c) :
    Scienter248a3Worship p c :=
  ⟨intentionalDamage, notParentalGuardian⟩


theorem scienter248_reproductiveServicesInterference_intro {p : Person}
    {c : ComplaintText} (h : Scienter248a1 p c) : Scienter248 p c :=
  .reproductiveServicesInterference h


theorem scienter248_worshipInterference_intro {p : Person} {c : ComplaintText}
    (h : Scienter248a2 p c) : Scienter248 p c :=
  .worshipInterference h


theorem scienter248_facilityPropertyDamage_intro {p : Person} {c : ComplaintText}
    (h : Scienter248a3Facility p c) : Scienter248 p c :=
  .facilityPropertyDamage h


theorem scienter248_worshipPropertyDamage_intro {p : Person} {c : ComplaintText}
    (h : Scienter248a3Worship p c) : Scienter248 p c :=
  .worshipPropertyDamage h


theorem scienterEnforcementAuthorization_federal_intro {p : Person}
    {c : ComplaintText} (h : DemandSatisfied p .s248c2_attorneyGeneralBelief c) :
    ScienterEnforcementAuthorization p c :=
  .federal h


theorem scienterEnforcementAuthorization_state_intro {p : Person}
    {c : ComplaintText} (h : DemandSatisfied p .s248c3_stateAttorneyGeneralBelief c) :
    ScienterEnforcementAuthorization p c :=
  .state h






theorem scienterPenaltyGrading_s245b_intro {p : Person} {c : ComplaintText} :
    ScienterPenaltyGrading p c :=
  .s245b s245b_resultEnhancement_needsNoMentalState


theorem scienterPenaltyGrading_s247d_intro {p : Person} {c : ComplaintText} :
    ScienterPenaltyGrading p c :=
  .s247d s247d_resultEnhancement_needsNoMentalState


theorem scienterPenaltyGrading_s248bResult_intro {p : Person} {c : ComplaintText} :
    ScienterPenaltyGrading p c :=
  .s248bResult s248b_resultEnhancement_needsNoMentalState


theorem scienterPenaltyGrading_s248bRecidivism_intro {p : Person} {c : ComplaintText} :
    ScienterPenaltyGrading p c :=
  .s248bRecidivism s248b_recidivism_needsNoMentalState

end Proving.USC.T18.Ch13.Reearn.Scienter










import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T18.Ch13.Reearn.Scienter.Types
import Proving.USC.T18.Ch13.Reearn.Scienter.Predicates

set_option autoImplicit false

namespace Proving.USC.T18.Ch13.Reearn.Scienter

open Proving.USC.Common














def demandMet (p : Person) (l : ScienterLocus) (c : ComplaintText) : ScienterDemand → Prop
  | .unspecified => UnclassifiedDemandMet p l c
  | .requires .StrictLiability => True
  | .requires r => ∃ rung : MentalState, rung.atLeast r ∧ MentalStateProvenAt p l rung c




def DemandSatisfied (p : Person) (l : ScienterLocus) (c : ComplaintText) : Prop :=
  demandMet p l c (requiredDemand l)











structure Scienter245bChapeau (p : Person) (c : ComplaintText) : Prop where


  willfulForce : DemandSatisfied p .s245b_forceConduct c


  notLawfulOfficerDuty : ¬ LawEnforcementLawfulDutyExclusion p c



structure Scienter245bBranchDemand (p : Person) (l : ScienterLocus)
    (c : ComplaintText) : Prop where

  isBranch : is245bBranch l = true

  branchDemand : DemandSatisfied p l c








inductive Scienter245b (p : Person) (c : ComplaintText) : Prop where

  | federalActivity (chapeau : Scienter245bChapeau p c)
      (motive : Scienter245bBranchDemand p .s245b1_motive c)


  | protectedClassActivity (chapeau : Scienter245bChapeau p c)
      (classMotive : Scienter245bBranchDemand p .s245b2_protectedClassMotive c)
      (activityMotive : Scienter245bBranchDemand p .s245b2_activityMotive c)

  | riotCommercialTarget (chapeau : Scienter245bChapeau p c)
      (target : Scienter245bBranchDemand p .s245b3_targetSelection c)


  | nondiscriminatoryParticipation (chapeau : Scienter245bChapeau p c)
      (motive : Scienter245bBranchDemand p .s245b4_motive c)

  | citizenAiding (chapeau : Scienter245bChapeau p c)
      (motive : Scienter245bBranchDemand p .s245b5_motive c)





structure Scienter245aCertification (p : Person) (c : ComplaintText) : Prop where

  certifyingJudgment : DemandSatisfied p .s245a1_certification c










structure Scienter247a1 (p : Person) (c : ComplaintText) : Prop where

  intentionalDamage : DemandSatisfied p .s247a1_conduct c

  religiousCharacterMotive : DemandSatisfied p .s247a1_religiousCharacterMotive c

  commerceCircumstance : DemandSatisfied p .s247b_commerceNexus c




structure Scienter247a2 (p : Person) (c : ComplaintText) : Prop where

  intentionalObstruction : DemandSatisfied p .s247a2_conduct c

  commerceCircumstance : DemandSatisfied p .s247b_commerceNexus c






structure Scienter247c (p : Person) (c : ComplaintText) : Prop where

  intentionalDamage : DemandSatisfied p .s247c_conduct c

  protectedClassMotive : DemandSatisfied p .s247c_protectedClassMotive c


inductive Scienter247 (p : Person) (c : ComplaintText) : Prop where

  | religiousPropertyDamage (h : Scienter247a1 p c)

  | freeExerciseObstruction (h : Scienter247a2 p c)

  | raceMotivatedPropertyDamage (h : Scienter247c p c)


structure Scienter247eCertification (p : Person) (c : ComplaintText) : Prop where

  certifyingJudgment : DemandSatisfied p .s247e_certification c








structure Scienter248a1 (p : Person) (c : ComplaintText) : Prop where

  intentionalInterference : DemandSatisfied p .s248a1_conduct c


  servicesMotive : DemandSatisfied p .s248a1_reproductiveServicesMotive c


  notParentalGuardian : ¬ ParentalGuardianExclusion p c




structure Scienter248a2 (p : Person) (c : ComplaintText) : Prop where

  intentionalInterference : DemandSatisfied p .s248a2_conduct c

  notParentalGuardian : ¬ ParentalGuardianExclusion p c



structure Scienter248a3Facility (p : Person) (c : ComplaintText) : Prop where

  intentionalDamage : DemandSatisfied p .s248a3_conduct c


  facilityMotive : DemandSatisfied p .s248a3_facilityMotive c

  notParentalGuardian : ¬ ParentalGuardianExclusion p c




structure Scienter248a3Worship (p : Person) (c : ComplaintText) : Prop where


  intentionalDamage : DemandSatisfied p .s248a3_conduct c

  notParentalGuardian : ¬ ParentalGuardianExclusion p c


inductive Scienter248 (p : Person) (c : ComplaintText) : Prop where

  | reproductiveServicesInterference (h : Scienter248a1 p c)

  | worshipInterference (h : Scienter248a2 p c)

  | facilityPropertyDamage (h : Scienter248a3Facility p c)

  | worshipPropertyDamage (h : Scienter248a3Worship p c)





inductive ScienterEnforcementAuthorization (p : Person) (c : ComplaintText) : Prop where

  | federal (h : DemandSatisfied p .s248c2_attorneyGeneralBelief c)

  | state (h : DemandSatisfied p .s248c3_stateAttorneyGeneralBelief c)









inductive ScienterPenaltyGrading (p : Person) (c : ComplaintText) : Prop where

  | s245b (h : DemandSatisfied p .s245b_resultEnhancement c)

  | s247d (h : DemandSatisfied p .s247d_resultEnhancement c)

  | s248bResult (h : DemandSatisfied p .s248b_resultEnhancement c)

  | s248bRecidivism (h : DemandSatisfied p .s248b_recidivism c)

end Proving.USC.T18.Ch13.Reearn.Scienter

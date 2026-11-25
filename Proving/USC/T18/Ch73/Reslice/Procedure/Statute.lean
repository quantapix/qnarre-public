








import Proving.USC.Common.Types
import Proving.USC.T18.Ch73.Reslice.Procedure.Types
import Proving.USC.T18.Ch73.Reslice.Procedure.Predicates

set_option autoImplicit false

namespace Proving.USC.T18.Ch73.Reslice.Procedure

open Proving.USC.Common






structure GuardedTransition (σ : Type) : Type where
  src : σ
  dst : σ
  guard : Prop



def tProceedingImminent (op : OfficialProceeding) (c : ComplaintText) :
    GuardedTransition ProceedingStage :=
  { src := .notInstituted, dst := .aboutToBeInstituted,
    guard := ProceedingAboutToBeInstituted op c }



def tProceedingInstituted (op : OfficialProceeding) (c : ComplaintText) :
    GuardedTransition ProceedingStage :=
  { src := .aboutToBeInstituted, dst := .pending,
    guard := ProceedingInstituted op c }



def tProsecutionCommenced (pr : Prosecution) (c : ComplaintText) :
    GuardedTransition ProsecutionStage :=
  { src := .notCommenced, dst := .commenced,
    guard := ProsecutionUnderSection1512 pr c }



def tDefenseRaised (pr : Prosecution) (d : Person) (c : ComplaintText) :
    GuardedTransition ProsecutionStage :=
  { src := .commenced, dst := .defenseRaised,
    guard := AffirmativeDefenseRaised pr d c }






def IsOfficialProceeding (op : OfficialProceeding) (c : ComplaintText) : Prop :=
  ProceedingBeforeFederalCourtOrGrandJury op c
  ∨ ProceedingBeforeCongress op c
  ∨ ProceedingBeforeFederalAgencyAuthorizedByLaw op c
  ∨ ProceedingBeforeInsuranceRegulator op c







def ProceedingPendingAtConduct
    (op : OfficialProceeding) (cd : Conduct) (c : ComplaintText) : Prop :=
  ProceedingInstituted op c ∧ proceedingInstitutionDay op c ≤ conductDay cd c




structure ProceedingNexus
    (cd : Conduct) (op : OfficialProceeding) (c : ComplaintText) : Prop where
  officialProceeding : IsOfficialProceeding op c
  intendedToAffect : IntendedToAffectProceeding cd op c






structure FederalCircumstance
    (op : OfficialProceeding) (c : ComplaintText) : Prop where
  federalForum : ProceedingIsFederalForum op c




def VenueBasis
    (cd : Conduct) (op : OfficialProceeding) (dist : District)
    (c : ComplaintText) : Prop :=
  ProceedingIntendedToBeAffectedInDistrict op dist c
  ∨ ConductOccurredInDistrict cd dist c



structure ProperVenue
    (pr : Prosecution) (cd : Conduct) (op : OfficialProceeding)
    (dist : District) (c : ComplaintText) : Prop where
  prosecutionBrought : ProsecutionUnderSection1512 pr c
  basis : VenueBasis cd op dist c




def FederalJurisdictionOverOffense (cd : Conduct) (c : ComplaintText) : Prop :=
  ConductIsOffenseUnderSection1512 cd c






def CompulsionDefiance
    (w : Person) (lp : LegalProcess) (op : OfficialProceeding)
    (c : ComplaintText) : Prop :=
  WitnessEvadedLegalProcess w lp c ∨ ¬ WitnessAppearedAtProceeding w op c



structure CompulsionDefied
    (w : Person) (lp : LegalProcess) (op : OfficialProceeding)
    (c : ComplaintText) : Prop where
  served : LegalProcessServed lp w c
  commandsAppearance : ProcessCommandsAppearanceAsWitness lp op c
  defiance : CompulsionDefiance w lp op c




structure ProductionDefeated
    (lp : LegalProcess) (w : Person) (it : EvidentiaryItem)
    (op : OfficialProceeding) (c : ComplaintText) : Prop where
  served : LegalProcessServed lp w c
  commandsProduction : ProcessCommandsProductionOfItem lp it op c
  notProduced : ¬ ItemProducedAtProceeding it op c
  integrityImpaired : ItemIntegrityImpairedForProceeding it op c





inductive PipelineStep : JusticeProcessStage → JusticeProcessStage → Prop


  | reportToArrest :
      PipelineStep .reportToLawEnforcement .arrestSought


  | arrestToInstitution :
      PipelineStep .arrestSought .prosecutionOrRevocationInstituted


  | institutionToAttendance :
      PipelineStep .prosecutionOrRevocationInstituted .attendanceOrTestimony


inductive PipelineReachable : JusticeProcessStage → JusticeProcessStage → Prop
  | refl (s : JusticeProcessStage) : PipelineReachable s s
  | step {a b z : JusticeProcessStage} :
      PipelineStep a b → PipelineReachable b z → PipelineReachable a z




def StageDelayed
    (s : JusticeProcessStage) (v : Person) (c : ComplaintText) : Prop :=
  scheduledStageDay s v c < actualStageDay s v c


def StagePrevented
    (s : JusticeProcessStage) (v : Person) (c : ComplaintText) : Prop :=
  ¬ StageOccurred s v c



def StageObstructed
    (s : JusticeProcessStage) (v : Person) (c : ComplaintText) : Prop :=
  StageHindered s v c ∨ StageDelayed s v c
  ∨ StagePrevented s v c ∨ StageDissuaded s v c



structure HarassmentObstruction
    (d : Person) (v : Person) (s : JusticeProcessStage)
    (c : ComplaintText) : Prop where
  harassment : IntentionalHarassment d v c
  obstructed : StageObstructed s v c






structure AffirmativeDefenseEstablished
    (pr : Prosecution) (d : Person) (cd : Conduct) (c : ComplaintText) : Prop where
  raised : AffirmativeDefenseRaised pr d c
  solelyLawful : ConductSolelyLawful cd c
  soleIntentTruthful : SoleIntentionToEncourageTruthfulTestimony d cd c
  burdenCarried : BurdenCarriedByPreponderance d c











structure ProsecutionSustainable
    (pr : Prosecution) (d : Person) (cd : Conduct)
    (op : OfficialProceeding) (dist : District) (c : ComplaintText) : Prop where
  prosecutionBrought : ProsecutionUnderSection1512 pr c
  nexus : ProceedingNexus cd op c
  federalCircumstance : FederalCircumstance op c
  venue : ProperVenue pr cd op dist c
  jurisdiction : FederalJurisdictionOverOffense cd c
  notLegalRepresentation : ¬ LawfulBonaFideLegalRepresentationServices d op c
  defenseNotEstablished : ¬ AffirmativeDefenseEstablished pr d cd c


structure ConspiracyProsecutionSustainable
    (pr : Prosecution) (d : Person) (cd : Conduct)
    (op : OfficialProceeding) (dist : District) (c : ComplaintText) : Prop where
  conspired : ConspiracyToCommitSection1512Offense d cd c
  posture : ProsecutionSustainable pr d cd op dist c



inductive Section1512ProceduralPosture
    (pr : Prosecution) (d : Person) (cd : Conduct)
    (op : OfficialProceeding) (dist : District) (c : ComplaintText) : Prop
  | substantive : ProsecutionSustainable pr d cd op dist c →
      Section1512ProceduralPosture pr d cd op dist c
  | conspiracy : ConspiracyProsecutionSustainable pr d cd op dist c →
      Section1512ProceduralPosture pr d cd op dist c









def declaredMaxMonths : OffenseTier → Option Nat
  | .killing => none
  | .attemptedMurder => some 360
  | .usedPhysicalForce => some 360
  | .threatenedPhysicalForce => some 240
  | .corruptPersuasion => some 240
  | .evidenceObstruction => some 240
  | .harassment => some 36





def conspiracyMaxMonths (t : OffenseTier) : Option Nat := declaredMaxMonths t





def enhancedMaxMonths (baseMonths chargedMaxMonths : Nat) : Nat :=
  max baseMonths chargedMaxMonths



structure PenaltyEnhancementTriggered
    (cd : Conduct) (pr : Prosecution) (c : ComplaintText) : Prop where
  prosecutionBrought : ProsecutionUnderSection1512 pr c
  inConnectionWithTrial : OffenseOccurredInConnectionWithCriminalTrial cd pr c

end Proving.USC.T18.Ch73.Reslice.Procedure

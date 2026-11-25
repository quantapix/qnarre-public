









import Proving.USC.Common.Types
import Proving.USC.T18.Ch73.Reslice.Procedure.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch73.Reslice.Procedure

open Proving.USC.Common








axiom ProceedingBeforeFederalCourtOrGrandJury
    (op : OfficialProceeding) (c : ComplaintText) : Prop



axiom ProceedingBeforeCongress
    (op : OfficialProceeding) (c : ComplaintText) : Prop




axiom ProceedingBeforeFederalAgencyAuthorizedByLaw
    (op : OfficialProceeding) (c : ComplaintText) : Prop





axiom ProceedingBeforeInsuranceRegulator
    (op : OfficialProceeding) (c : ComplaintText) : Prop







axiom ProceedingInstituted
    (op : OfficialProceeding) (c : ComplaintText) : Prop




axiom ProceedingAboutToBeInstituted
    (op : OfficialProceeding) (c : ComplaintText) : Prop





axiom conductDay (cd : Conduct) (c : ComplaintText) : Nat





axiom proceedingInstitutionDay (op : OfficialProceeding) (c : ComplaintText) : Nat






axiom EvidentiaryItemAdmissible (it : EvidentiaryItem) (c : ComplaintText) : Prop




axiom EvidentiaryItemFreeOfPrivilegeClaim
    (it : EvidentiaryItem) (c : ComplaintText) : Prop






axiom LegalProcessServed
    (lp : LegalProcess) (w : Person) (c : ComplaintText) : Prop




axiom ProcessCommandsAppearanceAsWitness
    (lp : LegalProcess) (op : OfficialProceeding) (c : ComplaintText) : Prop




axiom ProcessCommandsProductionOfItem
    (lp : LegalProcess) (it : EvidentiaryItem) (op : OfficialProceeding)
    (c : ComplaintText) : Prop




axiom WitnessAppearedAtProceeding
    (w : Person) (op : OfficialProceeding) (c : ComplaintText) : Prop




axiom WitnessEvadedLegalProcess
    (w : Person) (lp : LegalProcess) (c : ComplaintText) : Prop




axiom TestimonyGivenAtProceeding
    (w : Person) (op : OfficialProceeding) (c : ComplaintText) : Prop




axiom ItemProducedAtProceeding
    (it : EvidentiaryItem) (op : OfficialProceeding) (c : ComplaintText) : Prop





axiom ItemIntegrityImpairedForProceeding
    (it : EvidentiaryItem) (op : OfficialProceeding) (c : ComplaintText) : Prop








axiom IsFederalLawEnforcementOfficerOrJudge
    (o : Person) (c : ComplaintText) : Prop







axiom CommunicationMadeToFederalLawEnforcementOrJudge
    (informant : Person) (o : Person) (c : ComplaintText) : Prop




axiom ArrestSoughtForFederalOffense (subject : Person) (c : ComplaintText) : Prop




axiom CriminalProsecutionOrRevocationProceedingInstituted
    (op : OfficialProceeding) (c : ComplaintText) : Prop






axiom StageOccurred
    (s : JusticeProcessStage) (v : Person) (c : ComplaintText) : Prop




axiom StageHindered
    (s : JusticeProcessStage) (v : Person) (c : ComplaintText) : Prop



axiom StageDissuaded
    (s : JusticeProcessStage) (v : Person) (c : ComplaintText) : Prop





axiom scheduledStageDay
    (s : JusticeProcessStage) (v : Person) (c : ComplaintText) : Nat




axiom actualStageDay
    (s : JusticeProcessStage) (v : Person) (c : ComplaintText) : Nat



axiom IntentionalHarassment
    (d : Person) (v : Person) (c : ComplaintText) : Prop






axiom ConductOccurredInDistrict
    (cd : Conduct) (dist : District) (c : ComplaintText) : Prop




axiom ProceedingIntendedToBeAffectedInDistrict
    (op : OfficialProceeding) (dist : District) (c : ComplaintText) : Prop




axiom IntendedToAffectProceeding
    (cd : Conduct) (op : OfficialProceeding) (c : ComplaintText) : Prop





axiom ConductOccurredInUnitedStates (cd : Conduct) (c : ComplaintText) : Prop




axiom ConductIsOffenseUnderSection1512 (cd : Conduct) (c : ComplaintText) : Prop







axiom ProceedingIsFederalForum (op : OfficialProceeding) (c : ComplaintText) : Prop





axiom MentalStateProvedAsToFederalCircumstance
    (d : Person) (cd : Conduct) (c : ComplaintText) : Prop






axiom ProsecutionUnderSection1512 (pr : Prosecution) (c : ComplaintText) : Prop



axiom AffirmativeDefenseRaised
    (pr : Prosecution) (d : Person) (c : ComplaintText) : Prop



axiom ConductSolelyLawful (cd : Conduct) (c : ComplaintText) : Prop




axiom SoleIntentionToEncourageTruthfulTestimony
    (d : Person) (cd : Conduct) (c : ComplaintText) : Prop




axiom BurdenCarriedByPreponderance (d : Person) (c : ComplaintText) : Prop





axiom LawfulBonaFideLegalRepresentationServices
    (d : Person) (op : OfficialProceeding) (c : ComplaintText) : Prop







axiom offenseTier (cd : Conduct) (c : ComplaintText) : OffenseTier




axiom OffenseOccurredInConnectionWithCriminalTrial
    (cd : Conduct) (pr : Prosecution) (c : ComplaintText) : Prop





axiom maxTermForOffensesChargedInTrialMonths
    (pr : Prosecution) (c : ComplaintText) : Nat




axiom ConspiracyToCommitSection1512Offense
    (d : Person) (cd : Conduct) (c : ComplaintText) : Prop

end Proving.USC.T18.Ch73.Reslice.Procedure

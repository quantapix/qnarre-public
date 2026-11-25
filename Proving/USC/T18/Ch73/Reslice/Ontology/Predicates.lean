









import Proving.USC.T18.Ch73.Reslice.Ontology.Types
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch73.Reslice.Ontology

open Proving.USC.Common








axiom IsProceedingBeforeFederalCourtOrGrandJury (p : Proceeding) (c : ComplaintText) : Prop



axiom IsProceedingBeforeCongress (p : Proceeding) (c : ComplaintText) : Prop




axiom IsProceedingBeforeAuthorizedFederalAgency (p : Proceeding) (c : ComplaintText) : Prop





axiom IsInsuranceRegulatoryProceedingAffectingCommerce (p : Proceeding) (c : ComplaintText) : Prop





axiom IsProceedingPendingOrAboutToBeInstituted (p : Proceeding) (c : ComplaintText) : Prop





axiom IsPhysicalActionAgainstAnother (f : ForceAct) (c : ComplaintText) : Prop



axiom IsConfinement (f : ForceAct) (c : ComplaintText) : Prop





axiom IsKnowinglyFalseStatement (cd : Conduct) (c : ComplaintText) : Prop





axiom IsIntentionalOmissionOrConcealmentCreatingFalseImpression (cd : Conduct) (c : ComplaintText) : Prop





axiom IsKnowingInvitationOfRelianceOnFalseWriting (cd : Conduct) (c : ComplaintText) : Prop





axiom IsKnowingInvitationOfRelianceOnMisleadingObject (cd : Conduct) (c : ComplaintText) : Prop




axiom IsKnowingUseOfTrickSchemeOrDevice (cd : Conduct) (c : ComplaintText) : Prop







axiom IsFederalOfficerEmployeeOrAuthorizedAgent (p : Person) (c : ComplaintText) : Prop




axiom IsAuthorizedToEngageInOrSuperviseOffenseEnforcement (p : Person) (c : ComplaintText) : Prop




axiom IsProbationOrPretrialServicesOfficer (p : Person) (c : ComplaintText) : Prop





axiom IsCutAbrasionBruiseBurnOrDisfigurement (i : Injury) (c : ComplaintText) : Prop



axiom IsPhysicalPain (i : Injury) (c : ComplaintText) : Prop



axiom IsIllness (i : Injury) (c : ComplaintText) : Prop




axiom IsImpairmentOfBodilyOrMentalFunction (i : Injury) (c : ComplaintText) : Prop




axiom IsOtherInjuryToTheBody (i : Injury) (c : ComplaintText) : Prop







axiom IsCorruptlyPersuades (cd : Conduct) (c : ComplaintText) : Prop







axiom WouldBeMisleadingConductButForStateOfMind (cd : Conduct) (c : ComplaintText) : Prop





axiom corruptlyPersuades_excludes_stateless_misleading
    (cd : Conduct) (c : ComplaintText) :
    WouldBeMisleadingConductButForStateOfMind cd c → ¬ IsCorruptlyPersuades cd c







axiom IsCorruptlyUnderSection1505 (cd : Conduct) (c : ComplaintText) : Prop




axiom IsImproperPurposeActing (cd : Conduct) (c : ComplaintText) : Prop




axiom IsFalseOrMisleadingStatementMade (cd : Conduct) (c : ComplaintText) : Prop




axiom IsDocumentWithholdingConcealmentAlterationOrDestruction (cd : Conduct) (c : ComplaintText) : Prop



axiom corruptly1505_requires_improper_purpose
    (cd : Conduct) (c : ComplaintText) :
    IsCorruptlyUnderSection1505 cd c → IsImproperPurposeActing cd c




axiom corruptly1505_includes_false_or_misleading_statement
    (cd : Conduct) (c : ComplaintText) :
    IsImproperPurposeActing cd c → IsFalseOrMisleadingStatementMade cd c →
    IsCorruptlyUnderSection1505 cd c




axiom corruptly1505_includes_document_interference
    (cd : Conduct) (c : ComplaintText) :
    IsImproperPurposeActing cd c →
    IsDocumentWithholdingConcealmentAlterationOrDestruction cd c →
    IsCorruptlyUnderSection1505 cd c






axiom IsLawfulBonaFideLegalRepresentationService (cd : Conduct) (c : ComplaintText) : Prop




axiom IsInConnectionWithOrAnticipationOfProceeding
    (cd : Conduct) (p : Proceeding) (c : ComplaintText) : Prop









axiom IsCorruptlyAsUsedInSection1512 (cd : Conduct) (c : ComplaintText) : Prop





axiom IsJudgeOfTheUnitedStates (p : Person) (c : ComplaintText) : Prop




axiom IsRecordDocumentOrOtherObject (o : EvidentiaryObject) (c : ComplaintText) : Prop





axiom IsAdmissibleInEvidence (o : EvidentiaryObject) (c : ComplaintText) : Prop

end Proving.USC.T18.Ch73.Reslice.Ontology

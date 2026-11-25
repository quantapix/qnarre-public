








import Proving.USC.T18.Ch73.Reslice.Ontology.Types
import Proving.USC.T18.Ch73.Reslice.Ontology.Predicates
import Proving.USC.T18.Ch73.Reslice.Ontology.Statute
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch73.Reslice.Ontology

open Proving.USC.Common





theorem officialProceedingMembership_intro
    {p : Proceeding} {c : ComplaintText}
    (h : IsProceedingBeforeFederalCourtOrGrandJury p c ∨
         IsProceedingBeforeCongress p c ∨
         IsProceedingBeforeAuthorizedFederalAgency p c ∨
         IsInsuranceRegulatoryProceedingAffectingCommerce p c) :
    OfficialProceedingMembership p c :=
  match h with
  | Or.inl h => OfficialProceedingMembership.federalCourtOrGrandJury h
  | Or.inr (Or.inl h) => OfficialProceedingMembership.congress h
  | Or.inr (Or.inr (Or.inl h)) => OfficialProceedingMembership.authorizedFederalAgency h
  | Or.inr (Or.inr (Or.inr h)) => OfficialProceedingMembership.insuranceRegulatory h


theorem physicalForceMembership_intro
    {f : ForceAct} {c : ComplaintText}
    (h : IsPhysicalActionAgainstAnother f c ∨ IsConfinement f c) :
    PhysicalForceMembership f c :=
  match h with
  | Or.inl h => PhysicalForceMembership.physicalAction h
  | Or.inr h => PhysicalForceMembership.confinement h



theorem misleadingConductMembership_intro
    {cd : Conduct} {c : ComplaintText}
    (h : IsKnowinglyFalseStatement cd c ∨
         IsIntentionalOmissionOrConcealmentCreatingFalseImpression cd c ∨
         IsKnowingInvitationOfRelianceOnFalseWriting cd c ∨
         IsKnowingInvitationOfRelianceOnMisleadingObject cd c ∨
         IsKnowingUseOfTrickSchemeOrDevice cd c) :
    MisleadingConductMembership cd c :=
  match h with
  | Or.inl h => MisleadingConductMembership.falseStatement h
  | Or.inr (Or.inl h) => MisleadingConductMembership.omissionOrConcealment h
  | Or.inr (Or.inr (Or.inl h)) => MisleadingConductMembership.falseWriting h
  | Or.inr (Or.inr (Or.inr (Or.inl h))) => MisleadingConductMembership.misleadingObject h
  | Or.inr (Or.inr (Or.inr (Or.inr h))) => MisleadingConductMembership.trickSchemeOrDevice h


theorem lawEnforcementFunction_intro
    {p : Person} {c : ComplaintText}
    (h : IsAuthorizedToEngageInOrSuperviseOffenseEnforcement p c ∨
         IsProbationOrPretrialServicesOfficer p c) :
    LawEnforcementFunction p c :=
  match h with
  | Or.inl h => LawEnforcementFunction.enforcementAuthority h
  | Or.inr h => LawEnforcementFunction.probationOrPretrialOfficer h


theorem lawEnforcementOfficerMembership_intro
    {p : Person} {c : ComplaintText}
    (hStatus : IsFederalOfficerEmployeeOrAuthorizedAgent p c)
    (hFn : LawEnforcementFunction p c) :
    LawEnforcementOfficerMembership p c :=
  ⟨hStatus, hFn⟩


theorem bodilyInjuryMembership_intro
    {i : Injury} {c : ComplaintText}
    (h : IsCutAbrasionBruiseBurnOrDisfigurement i c ∨
         IsPhysicalPain i c ∨
         IsIllness i c ∨
         IsImpairmentOfBodilyOrMentalFunction i c ∨
         IsOtherInjuryToTheBody i c) :
    BodilyInjuryMembership i c :=
  match h with
  | Or.inl h => BodilyInjuryMembership.cutAbrasionBruiseBurnOrDisfigurement h
  | Or.inr (Or.inl h) => BodilyInjuryMembership.physicalPain h
  | Or.inr (Or.inr (Or.inl h)) => BodilyInjuryMembership.illness h
  | Or.inr (Or.inr (Or.inr (Or.inl h))) => BodilyInjuryMembership.impairment h
  | Or.inr (Or.inr (Or.inr (Or.inr h))) => BodilyInjuryMembership.otherInjury h




theorem corruptlyPersuadesMembership_intro
    {cd : Conduct} {c : ComplaintText}
    (h : IsCorruptlyPersuades cd c) :
    CorruptlyPersuadesMembership cd c :=
  ⟨h, fun hw => (corruptlyPersuades_excludes_stateless_misleading cd c hw) h⟩



theorem corruptlyMembership_intro
    {cd : Conduct} {c : ComplaintText}
    (h : IsCorruptlyUnderSection1505 cd c) :
    CorruptlyMembership cd c :=
  ⟨h, corruptly1505_requires_improper_purpose cd c h⟩



theorem corruptlyMembership_intro_falseStatement
    {cd : Conduct} {c : ComplaintText}
    (hPurpose : IsImproperPurposeActing cd c)
    (hStmt : IsFalseOrMisleadingStatementMade cd c) :
    CorruptlyMembership cd c :=
  ⟨corruptly1505_includes_false_or_misleading_statement cd c hPurpose hStmt, hPurpose⟩



theorem corruptlyMembership_intro_documentInterference
    {cd : Conduct} {c : ComplaintText}
    (hPurpose : IsImproperPurposeActing cd c)
    (hDoc : IsDocumentWithholdingConcealmentAlterationOrDestruction cd c) :
    CorruptlyMembership cd c :=
  ⟨corruptly1505_includes_document_interference cd c hPurpose hDoc, hPurpose⟩


theorem lawfulRepresentationCarveOut_intro
    {cd : Conduct} {p : Proceeding} {c : ComplaintText}
    (hSvc : IsLawfulBonaFideLegalRepresentationService cd c)
    (hNexus : IsInConnectionWithOrAnticipationOfProceeding cd p c)
    (hProc : IsOfficialProceeding p c) :
    LawfulRepresentationCarveOut cd p c :=
  ⟨hSvc, hNexus, hProc⟩




theorem section1512a2TermUse_intro
    {f : ForceAct} {p : Proceeding} {c : ComplaintText}
    (hForce : PhysicalForceMembership f c)
    (hProc : IsOfficialProceeding p c) :
    Section1512a2TermUse f p c :=
  ⟨hForce, hProc⟩


theorem section1512bTermUse_intro_persuasion
    {cd : Conduct} {p : Proceeding} {c : ComplaintText}
    (hPersuade : CorruptlyPersuadesMembership cd c)
    (hProc : IsOfficialProceeding p c) :
    Section1512bTermUse cd p c :=
  ⟨Or.inl hPersuade, hProc⟩



theorem section1512bTermUse_intro_misleading
    {cd : Conduct} {p : Proceeding} {c : ComplaintText}
    (hMislead : MisleadingConductMembership cd c)
    (hProc : IsOfficialProceeding p c) :
    Section1512bTermUse cd p c :=
  ⟨Or.inr hMislead, hProc⟩


theorem section1512b2ObjectTermUse_intro
    {o : EvidentiaryObject} {p : Proceeding} {c : ComplaintText}
    (hObj : IsRecordDocumentOrOtherObject o c)
    (hProc : IsOfficialProceeding p c) :
    Section1512b2ObjectTermUse o p c :=
  ⟨hObj, hProc⟩





theorem section1512b2ObjectTermUse_intro_inadmissible
    {o : EvidentiaryObject} {p : Proceeding} {c : ComplaintText}
    (hObj : IsRecordDocumentOrOtherObject o c)
    (hProc : IsOfficialProceeding p c)
    (_hInadmissible : ¬ IsAdmissibleInEvidence o c) :
    Section1512b2ObjectTermUse o p c :=
  ⟨hObj, hProc⟩


theorem section1512cTermUse_intro
    {cd : Conduct} {p : Proceeding} {c : ComplaintText}
    (hCorruptly : IsCorruptlyAsUsedInSection1512 cd c)
    (hProc : IsOfficialProceeding p c) :
    Section1512cTermUse cd p c :=
  ⟨hCorruptly, hProc⟩





theorem section1512cTermUse_intro_nonPendingProceeding
    {cd : Conduct} {p : Proceeding} {c : ComplaintText}
    (hCorruptly : IsCorruptlyAsUsedInSection1512 cd c)
    (hProc : IsOfficialProceeding p c)
    (_hNotPending : ¬ IsProceedingPendingOrAboutToBeInstituted p c) :
    Section1512cTermUse cd p c :=
  ⟨hCorruptly, hProc⟩


theorem section1512dTermUse_intro_officer
    {p : Proceeding} {r : Person} {c : ComplaintText}
    (hProc : IsOfficialProceeding p c)
    (hOfficer : LawEnforcementOfficerMembership r c) :
    Section1512dTermUse p r c :=
  ⟨hProc, Or.inl hOfficer⟩


theorem section1512dTermUse_intro_judge
    {p : Proceeding} {r : Person} {c : ComplaintText}
    (hProc : IsOfficialProceeding p c)
    (hJudge : IsJudgeOfTheUnitedStates r c) :
    Section1512dTermUse p r c :=
  ⟨hProc, Or.inr hJudge⟩

end Proving.USC.T18.Ch73.Reslice.Ontology

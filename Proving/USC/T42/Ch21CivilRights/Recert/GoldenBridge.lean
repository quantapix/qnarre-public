





























import Proving.TitleVI.Statute
import Proving.TitleIIEnf.Statute
import Proving.USC.T42.Ch21CivilRights.Recert.Elements.Statute
import Proving.USC.T42.Ch21CivilRights.Recert.Procedure.Statute

set_option autoImplicit false

namespace Proving.USC.T42.Ch21CivilRights.Recert.GoldenBridge

open Proving.USC.Common
open Proving.USC.T42.Ch21CivilRights.Recert





namespace TVI

axiom gPerson : Person → Proving.TitleVI.Person
axiom gComplaint : ComplaintText → Proving.TitleVI.ComplaintText
axiom gRecipient : Elements.Recipient → Proving.TitleVI.Recipient
axiom gProgram : Elements.Program → Proving.TitleVI.Program





axiom gAction : Person → Elements.Program → ComplaintText → Proving.TitleVI.Action



axiom gGround : Person → ComplaintText → Proving.TitleVI.ProtectedGround

axiom corr_personInUS {p : Person} {c : ComplaintText} :
    IsPersonInUS p c → Proving.TitleVI.IsPersonInUS (gPerson p) (gComplaint c)




axiom corr_notInstrumentality {p : Person} {c : ComplaintText} :
    ¬ Elements.IsStateInstrumentality p c →
    Proving.TitleVI.NotAStateInstrumentality (gPerson p) (gComplaint c)

axiom corr_isRecipient {r : Elements.Recipient} {pr : Elements.Program}
    {c : ComplaintText} :
    Elements.OperatesProgramOrActivity r pr c →
    Elements.ReceivesFederalFinancialAssistance pr c →
    Proving.TitleVI.IsRecipient (gRecipient r) (gComplaint c)

axiom corr_receivesFFA {r : Elements.Recipient} {pr : Elements.Program}
    {c : ComplaintText} :
    Elements.OperatesProgramOrActivity r pr c →
    Elements.ReceivesFederalFinancialAssistance pr c →
    Proving.TitleVI.ReceivesFederalFinancialAssistance (gRecipient r) (gComplaint c)

axiom corr_programOf {r : Elements.Recipient} {pr : Elements.Program} {c : ComplaintText} :
    Elements.OperatesProgramOrActivity r pr c →
    Elements.ProgramOrActivity2000d4a pr c →
    Proving.TitleVI.IsProgramOfRecipient (gProgram pr) (gRecipient r) (gComplaint c)

axiom corr_underProgram {p : Person} {pr : Elements.Program} {c : ComplaintText} :
    Elements.ProhibitedTreatment p pr c →
    Proving.TitleVI.OccursUnderProgram (gAction p pr c) (gProgram pr) (gComplaint c)

axiom corr_directed {p : Person} {pr : Elements.Program} {c : ComplaintText} :
    Elements.ProhibitedTreatment p pr c →
    Proving.TitleVI.ActionDirectedAtPerson (gAction p pr c) (gPerson p) (gComplaint c)




axiom corr_intentional {p : Person} {pr : Elements.Program} {c : ComplaintText} :
    Elements.ProhibitedGround p c →
    Elements.TreatmentOnGroundOfProtectedTrait p pr c →
    IntentToDiscriminate p c →
    Proving.TitleVI.IntentionalDiscrimination (gAction p pr c) (gGround p c) (gComplaint c)

















theorem s2000d_elements_implies_golden_modulo_gaps
    {p : Person} {r : Elements.Recipient} {pr : Elements.Program} {c : ComplaintText}
    (h : Elements.ValidSection2000dJudicialClaim p r pr c)
    (gap_officialCapacity :
      Proving.TitleVI.DefendantSuedInOfficialCapacity (gRecipient r) (gComplaint c)) :
    Proving.TitleVI.IntentionalDiscriminationClaim (gPerson p) (gRecipient r)
      (gProgram pr) (gAction p pr c) (gGround p c) (gComplaint c) :=
  ⟨⟨corr_personInUS h.violation.personInUS,
    corr_notInstrumentality h.violation.notStateInstrumentality,
    corr_isRecipient h.violation.operatesProgram h.violation.federallyAssisted,
    corr_receivesFFA h.violation.operatesProgram h.violation.federallyAssisted,
    corr_programOf h.violation.operatesProgram h.violation.programOrActivity,
    corr_underProgram h.violation.treatment⟩,
   corr_directed h.violation.treatment,
   corr_intentional h.violation.ground h.violation.onThatGround h.intentional,
   gap_officialCapacity⟩

end TVI





namespace TIIEnf



axiom eProceeding : Elements.Pleading → Proving.TitleIIEnf.Proceeding
axiom eDesignation : Elements.Pleading → Proving.TitleIIEnf.Designation
axiom eComplaint : ComplaintText → Proving.TitleIIEnf.ComplaintText

axiom corrE_pending {d : Person} {pp : Elements.PatternOrPractice} {pl : Elements.Pleading}
    {c : ComplaintText} :
    Elements.Section2000a5Action d pp pl c →
    Proving.TitleIIEnf.PendingEnforcementProceeding (eProceeding pl) (eComplaint c)

axiom corrE_requested {pl : Elements.Pleading} {c : ComplaintText} :
    Elements.ThreeJudgeCourtRequestFiled pl c →
    Proving.TitleIIEnf.AGRequestedThreeJudgeCourt (eProceeding pl) (eComplaint c)

axiom corrE_certificate {pl : Elements.Pleading} {c : ComplaintText} :
    Elements.CertificateOfGeneralPublicImportanceFiled pl c →
    Proving.TitleIIEnf.AccompaniedByPublicImportanceCertificate
      (eProceeding pl) (eComplaint c)
















theorem s2000a5_elements_implies_golden_modulo_gaps
    {d : Person} {pp : Elements.PatternOrPractice} {pl : Elements.Pleading}
    {c : ComplaintText}
    (h : Elements.Section2000a5ThreeJudgeCourt d pp pl c)
    (gap_furnishedChief :
      Proving.TitleIIEnf.RequestFurnishedToChiefJudge (eProceeding pl) (eComplaint c))
    (gap_designated :
      Proving.TitleIIEnf.ThreeJudgesDesignated (eDesignation pl) (eProceeding pl)
        (eComplaint c))
    (gap_composition :
      Proving.TitleIIEnf.PanelCompositionProper (eDesignation pl) (eComplaint c))
    (gap_expedited :
      Proving.TitleIIEnf.CaseExpeditedAtEarliestDate (eProceeding pl) (eComplaint c))
    (gap_scotusAppeal :
      Proving.TitleIIEnf.AppealLiesToSupremeCourt (eProceeding pl) (eComplaint c)) :
    Proving.TitleIIEnf.ThreeJudgeTrack (eProceeding pl) (eDesignation pl) (eComplaint c) :=
  ⟨corrE_pending h.action, corrE_requested h.requestFiled,
   corrE_certificate h.certificate, gap_furnishedChief, gap_designated,
   gap_composition, gap_expedited, gap_scotusAppeal⟩



axiom pProceeding : Procedure.AttorneyGeneralAction → Proving.TitleIIEnf.Proceeding
axiom pDesignation : Procedure.ThreeJudgeCourt → Proving.TitleIIEnf.Designation
axiom pComplaint : ComplaintText → Proving.TitleIIEnf.ComplaintText

axiom corrP_pending {act : Procedure.AttorneyGeneralAction} {d : Procedure.DistrictCourt}
    {c : ComplaintText} :
    Procedure.ProperlyFiledPatternPracticeComplaint act d c →
    Proving.TitleIIEnf.PendingEnforcementProceeding (pProceeding act) (pComplaint c)

axiom corrP_requested {act : Procedure.AttorneyGeneralAction} {c : ComplaintText} :
    Procedure.ThreeJudgeRequestFiledWithClerk act c →
    Proving.TitleIIEnf.AGRequestedThreeJudgeCourt (pProceeding act) (pComplaint c)

axiom corrP_certificate {act : Procedure.AttorneyGeneralAction} {c : ComplaintText} :
    Procedure.CertificateOfGeneralPublicImportanceFiled act c →
    Proving.TitleIIEnf.AccompaniedByPublicImportanceCertificate
      (pProceeding act) (pComplaint c)

axiom corrP_furnished {act : Procedure.AttorneyGeneralAction} {c : ComplaintText} :
    Procedure.ClerkFurnishedRequestToChiefCircuitJudge act c →
    Proving.TitleIIEnf.RequestFurnishedToChiefJudge (pProceeding act) (pComplaint c)

axiom corrP_designated {act : Procedure.AttorneyGeneralAction}
    {t : Procedure.ThreeJudgeCourt} {c : ComplaintText} :
    Procedure.ChiefCircuitJudgeDesignatedPanel act t c →
    Proving.TitleIIEnf.ThreeJudgesDesignated (pDesignation t) (pProceeding act)
      (pComplaint c)





axiom corrP_composition {t : Procedure.ThreeJudgeCourt} {c : ComplaintText} :
    Procedure.ThreeJudgePanelProperlyComposed t c →
    Proving.TitleIIEnf.PanelCompositionProper (pDesignation t) (pComplaint c)

axiom corrP_expedited {act : Procedure.AttorneyGeneralAction} {c : ComplaintText} :
    Procedure.CaseAssignedAtEarliestPracticableDate act c →
    Procedure.CaseExpedited act c →
    Proving.TitleIIEnf.CaseExpeditedAtEarliestDate (pProceeding act) (pComplaint c)



axiom corrP_scotusAppeal {act : Procedure.AttorneyGeneralAction} {c : ComplaintText} :
    Procedure.AppealTakenToSupremeCourt act c →
    Procedure.FinalJudgmentEntered act c →
    Proving.TitleIIEnf.AppealLiesToSupremeCourt (pProceeding act) (pComplaint c)










theorem s2000a5_procedure_implies_golden
    {act : Procedure.AttorneyGeneralAction} {d : Procedure.DistrictCourt}
    {t : Procedure.ThreeJudgeCourt} {c : ComplaintText}
    (hfiled : Procedure.ProperlyFiledPatternPracticeComplaint act d c)
    (h : Procedure.ThreeJudgeCourtConvened act t c)
    (hexp : Procedure.ExpeditedHearingDuty act c)
    (happeal : Procedure.DirectSupremeCourtAppeal act t c) :
    Proving.TitleIIEnf.ThreeJudgeTrack (pProceeding act) (pDesignation t) (pComplaint c) :=
  ⟨corrP_pending hfiled, corrP_requested h.requestFiled,
   corrP_certificate h.certificate, corrP_furnished h.clerkFurnished,
   corrP_designated h.designated, corrP_composition h.composition,
   corrP_expedited hexp.earliestPracticable hexp.expedited,
   corrP_scotusAppeal happeal.appealTaken happeal.finalJudgment⟩

end TIIEnf

end Proving.USC.T42.Ch21CivilRights.Recert.GoldenBridge

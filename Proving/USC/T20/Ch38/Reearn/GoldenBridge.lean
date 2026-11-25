


































import Proving.TitleIX.Statute
import Proving.USC.T20.Ch38.Reearn.Elements.Statute
import Proving.USC.Common.Predicates

set_option autoImplicit false

namespace Proving.USC.T20.Ch38.Reearn.GoldenBridge

open Proving.USC.Common







axiom gPerson    : Person                         → Proving.TitleIX.Person
axiom gComplaint : ComplaintText                  → Proving.TitleIX.ComplaintText
axiom gRecipient : Elements.Recipient             → Proving.TitleIX.Recipient
axiom gProgram   : Elements.EducationProgram      → Proving.TitleIX.Program









axiom corr_personInUS {p : Person} {c : ComplaintText} :
    IsPersonInUS p c → Proving.TitleIX.IsPersonInUS (gPerson p) (gComplaint c)

axiom corr_isRecipient {r : Elements.Recipient} {c : ComplaintText} :
    Elements.DefendantIsFundingRecipient r c →
    Proving.TitleIX.IsRecipient (gRecipient r) (gComplaint c)

axiom corr_receivesFFA {r : Elements.Recipient} {prog : Elements.EducationProgram}
    {c : ComplaintText} :
    Elements.DefendantIsFundingRecipient r c →
    Elements.ReceivesFederalFinancialAssistance prog c →
    Proving.TitleIX.ReceivesFederalFinancialAssistance (gRecipient r) (gComplaint c)



axiom corr_educationProgram {r : Elements.Recipient} {prog : Elements.EducationProgram}
    {c : ComplaintText} :
    Elements.CoveredEducationProgram prog c → Elements.DefendantIsFundingRecipient r c →
    Proving.TitleIX.IsEducationProgramOfRecipient (gProgram prog) (gRecipient r) (gComplaint c)




axiom corr_underProgram {p : Person} {r : Elements.Recipient}
    {prog : Elements.EducationProgram} {c : ComplaintText} (a : Proving.TitleIX.Action) :
    Elements.DiscriminationTheory1681a p r prog c →
    Proving.TitleIX.OccursUnderProgram a (gProgram prog) (gComplaint c)








axiom corr_notExcepted {p : Person} {inst : Elements.EducationalInstitution}
    {prog : Elements.EducationProgram} {c : ComplaintText} (a : Proving.TitleIX.Action) :
    ¬ Elements.Exemption1681a1 p inst c →
    ¬ Elements.Exemption1681a2 p inst c →
    ¬ Elements.ReligiouslyControlledInstitutionInconsistentWithTenets inst c →
    ¬ Elements.MilitaryOrMerchantMarineTrainingInstitution inst c →
    ¬ Elements.Exemption1681a5 p inst c →
    ¬ Elements.MembershipPracticeExemption1681a6 prog c →
    ¬ Elements.ConferenceActivityExemption1681a7 prog c →
    ¬ Elements.Exemption1681a8 prog c →
    ¬ Elements.Exemption1681a9 p c →
    Proving.TitleIX.NotWithinStatutoryException a (gProgram prog) (gComplaint c)



axiom corr_directed {p : Person} {r : Elements.Recipient}
    {prog : Elements.EducationProgram} {c : ComplaintText} (a : Proving.TitleIX.Action) :
    Elements.DiscriminationTheory1681a p r prog c →
    Proving.TitleIX.ActionDirectedAtPerson a (gPerson p) (gComplaint c)




axiom corr_intentional {p : Person} {prog : Elements.EducationProgram}
    {c : ComplaintText} (a : Proving.TitleIX.Action) :
    Elements.OnTheBasisOfSex p prog c → IntentToDiscriminate p c →
    Proving.TitleIX.IntentionalDiscrimination a Proving.TitleIX.ProtectedGround.sex
      (gComplaint c)



axiom corr_harassment {p : Person} {c : ComplaintText} (a : Proving.TitleIX.Action) :
    Elements.SubjectedToSexualHarassment p c → Elements.HarassmentSevereAndPervasive p c →
    Proving.TitleIX.SexualHarassmentSevereePervasive a (gPerson p) (gComplaint c)

axiom corr_actualKnowledge {r : Elements.Recipient} {c : ComplaintText}
    (a : Proving.TitleIX.Action) :
    Elements.RecipientHadActualKnowledge r c →
    Proving.TitleIX.RecipientHadActualKnowledge a (gComplaint c)

axiom corr_indifference {r : Elements.Recipient} {c : ComplaintText}
    (a : Proving.TitleIX.Action) :
    Elements.RecipientDeliberatelyIndifferent r c →
    Proving.TitleIX.DeliberateIndifference a (gComplaint c)

axiom corr_control {r : Elements.Recipient} {c : ComplaintText}
    (a : Proving.TitleIX.Action) :
    Elements.RecipientSubstantialControl r c →
    Proving.TitleIX.SubstantialControlOverHarasserAndContext a (gComplaint c)










theorem coverage_implies_golden_modulo_gaps
    {p : Person} {r : Elements.Recipient} {inst : Elements.EducationalInstitution}
    {prog : Elements.EducationProgram} {c : ComplaintText}
    (a : Proving.TitleIX.Action)
    (h : Elements.Section1681a p r inst prog c)
    (gap_notInstrumentality :
      Proving.TitleIX.NotAStateInstrumentality (gPerson p) (gComplaint c)) :
    Proving.TitleIX.TitleIXCoverage
      (gPerson p) (gRecipient r) (gProgram prog) a (gComplaint c) :=
  ⟨corr_personInUS h.personInUS,
   gap_notInstrumentality,
   corr_isRecipient h.recipientDefendant,
   corr_receivesFFA h.recipientDefendant h.coverage.scope.funded,
   corr_educationProgram h.coverage h.recipientDefendant,
   corr_underProgram a h.theory,
   corr_notExcepted a h.notAdmissionsUncovered h.notTransitional
     h.notReligiouslyControlled h.notMilitaryTraining h.notTraditionalSingleSex
     h.notMembershipPractice h.notConferenceActivity h.notParentChildActivity
     h.notPageantScholarship⟩






















theorem intentional_implies_golden_modulo_gaps
    {p : Person} {r : Elements.Recipient} {inst : Elements.EducationalInstitution}
    {prog : Elements.EducationProgram} {c : ComplaintText}
    (a : Proving.TitleIX.Action)
    (h : Elements.ValidTitleIXClaim p r inst prog c)
    (gap_notInstrumentality :
      Proving.TitleIX.NotAStateInstrumentality (gPerson p) (gComplaint c))
    (gap_officialCap :
      Proving.TitleIX.DefendantSuedInOfficialCapacity (gRecipient r) (gComplaint c)) :
    Proving.TitleIX.IntentionalDiscriminationClaim
      (gPerson p) (gRecipient r) (gProgram prog) a
      Proving.TitleIX.ProtectedGround.sex (gComplaint c) :=
  ⟨coverage_implies_golden_modulo_gaps a h.violation gap_notInstrumentality,
   corr_directed a h.violation.theory,
   corr_intentional a h.violation.basisOfSex h.intent,
   gap_officialCap⟩





















theorem deliberateIndifference_implies_golden_modulo_gaps
    {p : Person} {r : Elements.Recipient} {inst : Elements.EducationalInstitution}
    {prog : Elements.EducationProgram} {c : ComplaintText}
    (a : Proving.TitleIX.Action)
    (h : Elements.Section1681a p r inst prog c)
    (hh : Elements.HostileEnvironmentHarassment p r prog c)
    (gap_notInstrumentality :
      Proving.TitleIX.NotAStateInstrumentality (gPerson p) (gComplaint c))
    (gap_officialCap :
      Proving.TitleIX.DefendantSuedInOfficialCapacity (gRecipient r) (gComplaint c)) :
    Proving.TitleIX.DeliberateIndifferenceClaim
      (gPerson p) (gRecipient r) (gProgram prog) a (gComplaint c) :=
  ⟨coverage_implies_golden_modulo_gaps a h gap_notInstrumentality,
   corr_harassment a hh.harassment hh.severity,
   corr_actualKnowledge a hh.response.actualKnowledge,
   corr_indifference a hh.response.indifference,
   corr_control a hh.control,
   gap_officialCap⟩








theorem judicialClaim_implies_golden_modulo_gaps
    {p : Person} {r : Elements.Recipient} {inst : Elements.EducationalInstitution}
    {prog : Elements.EducationProgram} {c : ComplaintText}
    (a : Proving.TitleIX.Action)
    (h : Elements.ValidTitleIXClaim p r inst prog c)
    (gap_notInstrumentality :
      Proving.TitleIX.NotAStateInstrumentality (gPerson p) (gComplaint c))
    (gap_officialCap :
      Proving.TitleIX.DefendantSuedInOfficialCapacity (gRecipient r) (gComplaint c)) :
    Proving.TitleIX.ValidTitleIXJudicialClaim
      (gPerson p) (gRecipient r) (gComplaint c) :=
  .viaIntentional (gProgram prog) a Proving.TitleIX.ProtectedGround.sex
    (intentional_implies_golden_modulo_gaps a h gap_notInstrumentality gap_officialCap)

end Proving.USC.T20.Ch38.Reearn.GoldenBridge

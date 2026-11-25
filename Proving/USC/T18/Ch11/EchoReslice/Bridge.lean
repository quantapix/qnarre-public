




































import Proving.USC.T18.Ch11.EchoReslice.Elements.Statute
import Proving.USC.T18.Ch11.EchoReslice.Deontic.Statute
import Proving.USC.T18.Ch11.EchoReslice.Ontology.Statute
import Proving.USC.T18.Ch11.EchoReslice.Procedure.Statute
import Proving.USC.T18.Ch11.EchoReslice.Scienter.Statute
import Proving.USC.Common.Types
import Proving.Rico.Predicates

set_option autoImplicit false

namespace Proving.USC.T18.Ch11.EchoReslice.Bridge

open Proving.USC.Common (Person ComplaintText)










namespace ED





axiom mapV : Elements.ThingOfValue → Deontic.ThingOfValue

axiom mapA : Elements.OfficialAct → Deontic.OfficialAct

axiom mapPr : Elements.Proceeding → Deontic.Proceeding

axiom corr_corruptly {p c} : Elements.ActsCorruptly p c → Deontic.ActsCorruptly p c
axiom corr_official {p c} : Elements.IsPublicOfficial p c → Deontic.IsPublicOfficial p c
axiom corr_selectee {p c} : Elements.IsPersonSelectedToBePublicOfficial p c →
    Deontic.IsPersonSelectedToBePublicOfficial p c
axiom corr_former {p c} : Elements.IsFormerPublicOfficial p c → Deontic.IsFormerPublicOfficial p c
axiom corr_officialAct {act c} : Elements.IsOfficialAct act c → Deontic.IsOfficialAct (mapA act) c
axiom corr_confers {payor recip v c} : Elements.ConfersThingOfValue payor recip v c →
    Deontic.GivesOffersOrPromisesThingOfValue payor recip (mapV v) c
axiom corr_demands {p v c} :
    Elements.DemandsSeeksReceivesAcceptsOrAgreesToAcceptThingOfValue p v c →
    Deontic.DemandsSeeksReceivesOrAcceptsThingOfValue p (mapV v) c
axiom corr_personally {p v c} : Elements.DemandsSeeksOrAcceptsThingOfValuePersonally p v c →
    Deontic.DemandsSeeksReceivesOrAcceptsThingOfValue p (mapV v) c ∧
      Deontic.ReceivesThingOfValuePersonally p (mapV v) c
axiom corr_intentInfluence {payor official act c} :
    Elements.IntentToInfluenceOfficialAct payor official act c →
    Deontic.IntentToInfluenceOfficialAct payor (mapA act) c
axiom corr_intentFraud {payor official c} :
    Elements.IntentToInduceFraudOnTheUnitedStates payor official c →
    Deontic.IntentToInfluenceCommissionOfFraudOnUnitedStates payor official c
axiom corr_intentDuty {payor official c} :
    Elements.IntentToInduceViolationOfLawfulDuty payor official c →
    Deontic.IntentToInduceViolationOfLawfulDuty payor official c
axiom corr_returnInfluence {official v act c} :
    Elements.InReturnForBeingInfluencedInOfficialAct official v act c →
    Deontic.InReturnForBeingInfluencedInOfficialAct official (mapA act) c
axiom corr_returnFraud {official v c} :
    Elements.InReturnForBeingInfluencedToAllowFraudOnTheUnitedStates official v c →
    Deontic.InReturnForBeingInfluencedToCommitFraudOnUnitedStates official c
axiom corr_returnDuty {official v c} :
    Elements.InReturnForBeingInducedToViolateOfficialDuty official v c →
    Deontic.InReturnForBeingInducedToViolateOfficialDuty official c
axiom corr_witness {w pr c} : Elements.WitnessInQualifyingProceeding w pr c →
    Deontic.IsWitnessInFederalProceeding w (mapPr pr) c
axiom corr_intentTestimony {payor w pr c} : Elements.IntentToInfluenceTestimony payor w pr c →
    Deontic.IntentToInfluenceTestimony payor w (mapPr pr) c
axiom corr_intentAbsence {payor w pr c} : Elements.IntentToInduceWitnessAbsence payor w pr c →
    Deontic.IntentToInduceAbsenceFromProceeding payor w (mapPr pr) c
axiom corr_returnTestimony {w v pr c} : Elements.InReturnForBeingInfluencedInTestimony w v pr c →
    Deontic.InReturnForBeingInfluencedInTestimony w (mapPr pr) c
axiom corr_returnAbsence {w v pr c} : Elements.InReturnForAbsentingFromProceeding w v pr c →
    Deontic.InReturnForAbsentingFromProceeding w (mapPr pr) c
axiom corr_notAuthorized {v official c} :
    ¬ Elements.AuthorizedByLawForProperDischargeOfOfficialDuty v official c →
    Deontic.OtherwiseThanAsProvidedByLawForProperDischargeOfOfficialDuty (mapV v) c
axiom corr_gratuityNexus {v official act c} : Elements.OfficialActGratuityNexus v official act c →
    Deontic.ForOrBecauseOfOfficialActPerformedOrToBePerformed (mapV v) (mapA act) c
axiom corr_witnessNexus {v w pr c} : Elements.WitnessGratuityNexus v w pr c →
    Deontic.ForOrBecauseOfTestimonyOrAbsence (mapV v) (mapPr pr) c




axiom corr_exemption {v pr c} :
    Deontic.WitnessFeeOrExpenseExemptionApplies (mapV v) (mapPr pr) c →
    Elements.WitnessFeeException201d v pr c

theorem covered_to_or {p c} (h : Elements.CoveredOfficialOrSelectee p c) :
    Deontic.OfficialOrSelectee p c :=
  match h with
  | .official h => Or.inl (corr_official h)
  | .selectee h => Or.inr (corr_selectee h)

theorem coveredFormer_to_or {p c} (h : Elements.CoveredOfficialSelecteeOrFormer p c) :
    Deontic.OfficialFormerOrSelectee p c :=
  match h with
  | .official h => Or.inl (corr_official h)
  | .former h => Or.inr (Or.inl (corr_former h))
  | .selectee h => Or.inr (Or.inr (corr_selectee h))

theorem intent_b1 {payor official act c} (h : Elements.BriberyIntent201b1 payor official act c) :
    Deontic.Intent201b1 payor official (mapA act) c :=
  match h with
  | .influenceOfficialAct h =>
      .influenceOfficialAct (corr_officialAct h.qualifies) (corr_intentInfluence h.intent)
  | .fraudOnUnitedStates h => .influenceFraudOnUnitedStates (corr_intentFraud h)
  | .violationOfLawfulDuty h => .induceViolationOfLawfulDuty (corr_intentDuty h)

theorem return_b2 {official v act c} (h : Elements.BriberyReturn201b2 official v act c) :
    Deontic.ReturnFor201b2 official (mapA act) c :=
  match h with
  | .influencedInOfficialAct h =>
      .influencedInOfficialAct (corr_officialAct h.qualifies) (corr_returnInfluence h.bargain)
  | .allowFraudOnUnitedStates h => .influencedToCommitFraudOnUnitedStates (corr_returnFraud h)
  | .violationOfOfficialDuty h => .inducedToViolateOfficialDuty (corr_returnDuty h)

theorem intent_b3 {payor w pr c} (h : Elements.WitnessBriberyIntent201b3 payor w pr c) :
    Deontic.Intent201b3 payor w (mapPr pr) c :=
  match h with
  | .influenceTestimony h => .influenceTestimony (corr_intentTestimony h)
  | .induceAbsence h => .induceAbsence (corr_intentAbsence h)

theorem return_b4 {w v pr c} (h : Elements.WitnessBriberyReturn201b4 w v pr c) :
    Deontic.ReturnFor201b4 w (mapPr pr) c :=
  match h with
  | .influencedInTestimony h => .influencedInTestimony (corr_returnTestimony h)
  | .absentedFromProceeding h => .absentingFromProceeding (corr_returnAbsence h)









theorem s201_elements_implies_deontic_modulo_gaps {c : ComplaintText}
    (gap_addressee_whoever : ∀ p : Person, Deontic.AddresseeWhoever p c)
    (h : Elements.ViolatesSection201 c) : Deontic.Section201Violated c :=
  match h with
  | .bribery hb =>
    match hb with
    | .officialPayor payor official v act hs =>
        .b1 payor official (mapV v) (mapA act)
          ⟨⟨gap_addressee_whoever payor, covered_to_or hs.recipientStatus⟩,
           corr_confers hs.conferral, corr_corruptly hs.corruptly, intent_b1 hs.intent⟩
    | .officialPayee official v act hs =>
        .b2 official (mapV v) (mapA act)
          ⟨⟨covered_to_or hs.officialStatus⟩, corr_demands hs.solicitation,
           corr_corruptly hs.corruptly, return_b2 hs.bargain⟩
    | .witnessPayor payor w v pr hs =>
        .b3 payor w (mapV v) (mapPr pr)
          ⟨⟨gap_addressee_whoever payor, corr_witness hs.witnessStatus⟩,
           corr_confers hs.conferral, corr_corruptly hs.corruptly, intent_b3 hs.intent,
           fun hd => hs.notExcepted (corr_exemption hd)⟩
    | .witnessPayee w v pr hs =>
        .b4 w (mapV v) (mapPr pr)
          ⟨⟨gap_addressee_whoever w, corr_witness hs.witnessStatus⟩,
           corr_demands hs.solicitation, corr_corruptly hs.corruptly, return_b4 hs.bargain,
           fun hd => hs.notExcepted (corr_exemption hd)⟩
  | .gratuity hg =>
    match hg with
    | .officialPayor payor official v act hs =>
        .c1A payor official (mapV v) (mapA act)
          ⟨⟨gap_addressee_whoever payor, coveredFormer_to_or hs.recipientStatus⟩,
           corr_confers (.direct hs.conferral), corr_notAuthorized hs.notAuthorizedByLaw,
           corr_officialAct hs.nexus.qualifies, corr_gratuityNexus hs.nexus⟩
    | .officialPayee official v act hs =>
        .c1B official (mapV v) (mapA act)
          ⟨⟨coveredFormer_to_or hs.officialStatus⟩,
           (corr_personally hs.solicitation).1, (corr_personally hs.solicitation).2,
           corr_notAuthorized hs.notAuthorizedByLaw,
           corr_officialAct hs.nexus.qualifies, corr_gratuityNexus hs.nexus⟩
    | .witnessPayor payor w v pr hs =>
        .c2 payor w (mapV v) (mapPr pr)
          ⟨⟨gap_addressee_whoever payor, corr_witness hs.witnessStatus⟩,
           corr_confers (.direct hs.conferral), corr_witnessNexus hs.nexus,
           fun hd => hs.notExcepted (corr_exemption hd)⟩
    | .witnessPayee w v pr hs =>
        .c3 w (mapV v) (mapPr pr)
          ⟨⟨gap_addressee_whoever w, corr_witness hs.witnessStatus⟩,
           (corr_personally hs.solicitation).1, (corr_personally hs.solicitation).2,
           corr_witnessNexus hs.nexus, fun hd => hs.notExcepted (corr_exemption hd)⟩

end ED















namespace EP

axiom mapT : Elements.ThingOfValue → Procedure.Transfer
axiom mapA : Elements.OfficialAct → Procedure.OfficialAct
axiom mapM : Elements.OfficialAct → Procedure.Matter
axiom mapPr : Elements.Proceeding → Procedure.Proceeding
axiom mapF : Elements.Proceeding → Procedure.Forum

axiom corr_transferStep {payor recip v c} : Elements.ActsCorruptly payor c →
    Elements.ConfersThingOfValue payor recip v c →
    Procedure.CorruptlyGivesOffersOrPromises (mapT v) payor c
axiom corr_receiptStep {p v c} : Elements.ActsCorruptly p c →
    Elements.DemandsSeeksReceivesAcceptsOrAgreesToAcceptThingOfValue p v c →
    Procedure.CorruptlyDemandsSeeksReceivesOrAccepts (mapT v) p c
axiom corr_directed {payor recip v c} : Elements.ConfersThingOfValue payor recip v c →
    Procedure.ValueDirectedToOfficialOrDesignee (mapT v) recip c
axiom corr_gives {payor recip v c} : Elements.ConfersThingOfValue payor recip v c →
    Procedure.GivesOffersOrPromises (mapT v) payor c
axiom corr_demandsPersonally {p v c} : Elements.DemandsSeeksOrAcceptsThingOfValuePersonally p v c →
    Procedure.DemandsSeeksReceivesOrAccepts (mapT v) p c
axiom corr_official {p c} : Elements.IsPublicOfficial p c → Procedure.PublicOfficialStatus p c
axiom corr_selectee {p c} : Elements.IsPersonSelectedToBePublicOfficial p c →
    Procedure.SelectedForOfficeStatus p c
axiom corr_former {p c} : Elements.IsFormerPublicOfficial p c →
    Procedure.PublicOfficialStatus p c ∧ Procedure.OfficialServiceEnded p c
axiom corr_actB1 {payor official act c} : Elements.OfficialActInfluenceIntent payor official act c →
    Procedure.QualifyingOfficialAct (mapA act) (mapM act) official c
axiom corr_actB2 {official v act c} : Elements.OfficialActInfluenceBargain official v act c →
    Procedure.QualifyingOfficialAct (mapA act) (mapM act) official c
axiom corr_actC1 {v official act c} : Elements.OfficialActGratuityNexus v official act c →
    Procedure.QualifyingOfficialAct (mapA act) (mapM act) official c
axiom corr_objFraudPayor {payor official v c} :
    Elements.IntentToInduceFraudOnTheUnitedStates payor official c →
    Procedure.ObjectIsFraudOnUnitedStates (mapT v) c
axiom corr_objDutyPayor {payor official v c} :
    Elements.IntentToInduceViolationOfLawfulDuty payor official c →
    Procedure.ObjectIsActInViolationOfLawfulDuty (mapT v) c
axiom corr_objFraudPayee {official v c} :
    Elements.InReturnForBeingInfluencedToAllowFraudOnTheUnitedStates official v c →
    Procedure.ObjectIsFraudOnUnitedStates (mapT v) c
axiom corr_objDutyPayee {official v c} :
    Elements.InReturnForBeingInducedToViolateOfficialDuty official v c →
    Procedure.ObjectIsActInViolationOfLawfulDuty (mapT v) c
axiom corr_proceeding {w pr c} : Elements.WitnessInQualifyingProceeding w pr c →
    Procedure.QualifyingProceeding (mapPr pr) (mapF pr) c
axiom corr_testifies {w pr c} : Elements.TestifiesUnderOathAsWitness w pr c →
    Procedure.TestimonyGivenOrToBeGivenUnderOath w (mapPr pr) c
axiom corr_safeHarbor {v w pr c} : Procedure.WitnessFeeSafeHarbor (mapT v) w (mapPr pr) c →
    Elements.WitnessFeeException201d v pr c
axiom corr_lawfulChannel {v official c} :
    Procedure.AuthorizedByLawForProperDischargeOfDuty (mapT v) c →
    Elements.AuthorizedByLawForProperDischargeOfOfficialDuty v official c

theorem covered_to_p {p c} (h : Elements.CoveredOfficialOrSelectee p c) :
    Procedure.CoveredOfficialOrSelectee p c :=
  match h with
  | .official h => .official (corr_official h)
  | .selectee h => .selectee (corr_selectee h)

theorem coveredFormer_to_p {p c} (h : Elements.CoveredOfficialSelecteeOrFormer p c) :
    Procedure.CoveredGratuityRecipientClass p c :=
  match h with
  | .official h => .official (corr_official h)
  | .former h => .former ⟨(corr_former h).1, (corr_former h).2⟩
  | .selectee h => .selectee (corr_selectee h)

theorem obj_b1 {payor official v act c}
    (gap : Procedure.TransferPrecedesOrAccompaniesAct (mapT v) (mapA act) c)
    (h : Elements.BriberyIntent201b1 payor official act c) :
    Procedure.SubsectionB1Object (mapT v) official c :=
  match h with
  | .influenceOfficialAct h => .officialAct (corr_actB1 h) gap
  | .fraudOnUnitedStates h => .fraudOnUnitedStates (corr_objFraudPayor h)
  | .violationOfLawfulDuty h => .dutyViolation (corr_objDutyPayor h)

theorem obj_b2 {official v act c}
    (gap : Procedure.TransferPrecedesOrAccompaniesAct (mapT v) (mapA act) c)
    (h : Elements.BriberyReturn201b2 official v act c) :
    Procedure.SubsectionB2Object (mapT v) official c :=
  match h with
  | .influencedInOfficialAct h => .officialAct (corr_actB2 h) gap
  | .allowFraudOnUnitedStates h => .fraudOnUnitedStates (corr_objFraudPayee h)
  | .violationOfOfficialDuty h => .dutyViolation (corr_objDutyPayee h)









theorem s201_elements_implies_procedure_modulo_gaps {c : ComplaintText}
    (gap_b_transfer_precedes_act : ∀ (v : Elements.ThingOfValue) (act : Elements.OfficialAct),
        Procedure.TransferPrecedesOrAccompaniesAct (mapT v) (mapA act) c)
    (h : Elements.ViolatesSection201 c) : Procedure.Section201Route c :=
  match h with
  | .bribery hb =>
    match hb with
    | .officialPayor payor official v act hs =>
        .subsectionB (.b1
          ⟨corr_transferStep hs.corruptly hs.conferral, corr_directed hs.conferral,
           covered_to_p hs.recipientStatus, obj_b1 (gap_b_transfer_precedes_act v act) hs.intent⟩)
    | .officialPayee official v act hs =>
        .subsectionB (.b2
          ⟨corr_receiptStep hs.corruptly hs.solicitation, covered_to_p hs.officialStatus,
           obj_b2 (gap_b_transfer_precedes_act v act) hs.bargain⟩)
    | .witnessPayor payor w v pr hs =>
        .subsectionB (.b3
          ⟨corr_transferStep hs.corruptly hs.conferral, corr_directed hs.conferral,
           corr_proceeding hs.witnessStatus,
           .testimony (corr_testifies hs.witnessStatus.testifies),
           fun hsh => hs.notExcepted (corr_safeHarbor hsh)⟩)
    | .witnessPayee w v pr hs =>
        .subsectionB (.b4
          ⟨corr_receiptStep hs.corruptly hs.solicitation, corr_proceeding hs.witnessStatus,
           .testimony (corr_testifies hs.witnessStatus.testifies),
           fun hsh => hs.notExcepted (corr_safeHarbor hsh)⟩)
  | .gratuity hg =>
    match hg with
    | .officialPayor payor official v act hs =>
        .subsectionC (.c1a
          ⟨fun hp => hs.notAuthorizedByLaw (corr_lawfulChannel hp),
           corr_gives (.direct hs.conferral), corr_directed (.direct hs.conferral),
           coveredFormer_to_p hs.recipientStatus, corr_actC1 hs.nexus,
           Nat.le_total (Procedure.dayOfOfficialAct (mapA act) c)
             (Procedure.dayOfTransfer (mapT v) c)⟩)
    | .officialPayee official v act hs =>
        .subsectionC (.c1b
          ⟨fun hp => hs.notAuthorizedByLaw (corr_lawfulChannel hp),
           corr_demandsPersonally hs.solicitation, coveredFormer_to_p hs.officialStatus,
           corr_actC1 hs.nexus,
           Nat.le_total (Procedure.dayOfOfficialAct (mapA act) c)
             (Procedure.dayOfTransfer (mapT v) c)⟩)
    | .witnessPayor payor w v pr hs =>
        .subsectionC (.c2
          ⟨corr_gives (.direct hs.conferral), corr_directed (.direct hs.conferral),
           corr_proceeding hs.witnessStatus,
           .testimony (corr_testifies hs.witnessStatus.testifies),
           fun hsh => hs.notExcepted (corr_safeHarbor hsh)⟩)
    | .witnessPayee w v pr hs =>
        .subsectionC (.c3
          ⟨corr_demandsPersonally hs.solicitation, corr_proceeding hs.witnessStatus,
           .testimony (corr_testifies hs.witnessStatus.testifies),
           fun hsh => hs.notExcepted (corr_safeHarbor hsh)⟩)

end EP















namespace DP

axiom mapT : Deontic.ThingOfValue → Procedure.Transfer
axiom mapA : Deontic.OfficialAct → Procedure.OfficialAct
axiom mapM : Deontic.OfficialAct → Procedure.Matter
axiom mapPr : Deontic.Proceeding → Procedure.Proceeding
axiom mapF : Deontic.Proceeding → Procedure.Forum

axiom corr_transferStep {giver recip v c} : Deontic.ActsCorruptly giver c →
    Deontic.GivesOffersOrPromisesThingOfValue giver recip v c →
    Procedure.CorruptlyGivesOffersOrPromises (mapT v) giver c
axiom corr_receiptStep {p v c} : Deontic.ActsCorruptly p c →
    Deontic.DemandsSeeksReceivesOrAcceptsThingOfValue p v c →
    Procedure.CorruptlyDemandsSeeksReceivesOrAccepts (mapT v) p c
axiom corr_directed {giver recip v c} :
    Deontic.GivesOffersOrPromisesThingOfValue giver recip v c →
    Procedure.ValueDirectedToOfficialOrDesignee (mapT v) recip c
axiom corr_gives {giver recip v c} :
    Deontic.GivesOffersOrPromisesThingOfValue giver recip v c →
    Procedure.GivesOffersOrPromises (mapT v) giver c
axiom corr_demands {p v c} : Deontic.DemandsSeeksReceivesOrAcceptsThingOfValue p v c →
    Procedure.DemandsSeeksReceivesOrAccepts (mapT v) p c
axiom corr_official {p c} : Deontic.IsPublicOfficial p c → Procedure.PublicOfficialStatus p c
axiom corr_selectee {p c} : Deontic.IsPersonSelectedToBePublicOfficial p c →
    Procedure.SelectedForOfficeStatus p c
axiom corr_former {p c} : Deontic.IsFormerPublicOfficial p c →
    Procedure.PublicOfficialStatus p c ∧ Procedure.OfficialServiceEnded p c
axiom corr_act {a official c} : Deontic.IsOfficialAct a c →
    Procedure.QualifyingOfficialAct (mapA a) (mapM a) official c
axiom corr_objFraud {giver recip v c} :
    Deontic.IntentToInfluenceCommissionOfFraudOnUnitedStates giver recip c →
    Procedure.ObjectIsFraudOnUnitedStates (mapT v) c
axiom corr_objDuty {giver recip v c} :
    Deontic.IntentToInduceViolationOfLawfulDuty giver recip c →
    Procedure.ObjectIsActInViolationOfLawfulDuty (mapT v) c
axiom corr_objFraudPayee {taker v c} :
    Deontic.InReturnForBeingInfluencedToCommitFraudOnUnitedStates taker c →
    Procedure.ObjectIsFraudOnUnitedStates (mapT v) c
axiom corr_objDutyPayee {taker v c} :
    Deontic.InReturnForBeingInducedToViolateOfficialDuty taker c →
    Procedure.ObjectIsActInViolationOfLawfulDuty (mapT v) c
axiom corr_proceeding {w pr c} : Deontic.IsWitnessInFederalProceeding w pr c →
    Procedure.QualifyingProceeding (mapPr pr) (mapF pr) c
axiom corr_conduct {w pr c} : Deontic.IsWitnessInFederalProceeding w pr c →
    Procedure.WitnessConductTargeted w (mapPr pr) c
axiom corr_safeHarbor {v w pr c} : Procedure.WitnessFeeSafeHarbor (mapT v) w (mapPr pr) c →
    Deontic.WitnessFeeOrExpenseExemptionApplies v pr c
axiom corr_lawfulChannel {v c} :
    Deontic.OtherwiseThanAsProvidedByLawForProperDischargeOfOfficialDuty v c →
    ¬ Procedure.AuthorizedByLawForProperDischargeOfDuty (mapT v) c

theorem covered_to_p {p c} (h : Deontic.OfficialOrSelectee p c) :
    Procedure.CoveredOfficialOrSelectee p c :=
  match h with
  | Or.inl hh => .official (corr_official hh)
  | Or.inr hh => .selectee (corr_selectee hh)

theorem coveredFormer_to_p {p c} (h : Deontic.OfficialFormerOrSelectee p c) :
    Procedure.CoveredGratuityRecipientClass p c :=
  match h with
  | Or.inl hh => .official (corr_official hh)
  | Or.inr (Or.inl hh) => .former ⟨(corr_former hh).1, (corr_former hh).2⟩
  | Or.inr (Or.inr hh) => .selectee (corr_selectee hh)

theorem obj_b1 {giver recip v a c}
    (gap : Procedure.TransferPrecedesOrAccompaniesAct (mapT v) (mapA a) c)
    (h : Deontic.Intent201b1 giver recip a c) :
    Procedure.SubsectionB1Object (mapT v) recip c :=
  match h with
  | .influenceOfficialAct hAct _ => .officialAct (corr_act hAct) gap
  | .influenceFraudOnUnitedStates hh => .fraudOnUnitedStates (corr_objFraud hh)
  | .induceViolationOfLawfulDuty hh => .dutyViolation (corr_objDuty hh)

theorem obj_b2 {taker v a c}
    (gap : Procedure.TransferPrecedesOrAccompaniesAct (mapT v) (mapA a) c)
    (h : Deontic.ReturnFor201b2 taker a c) :
    Procedure.SubsectionB2Object (mapT v) taker c :=
  match h with
  | .influencedInOfficialAct hAct _ => .officialAct (corr_act hAct) gap
  | .influencedToCommitFraudOnUnitedStates hh => .fraudOnUnitedStates (corr_objFraudPayee hh)
  | .inducedToViolateOfficialDuty hh => .dutyViolation (corr_objDutyPayee hh)


theorem s201_deontic_implies_procedure_modulo_gaps {c : ComplaintText}
    (gap_b_transfer_precedes_act : ∀ (v : Deontic.ThingOfValue) (a : Deontic.OfficialAct),
        Procedure.TransferPrecedesOrAccompaniesAct (mapT v) (mapA a) c)
    (h : Deontic.Section201Violated c) : Procedure.Section201Route c :=
  match h with
  | .b1 _ _ v a hs =>
      .subsectionB (.b1
        ⟨corr_transferStep hs.2.2.1 hs.2.1, corr_directed hs.2.1,
         covered_to_p hs.1.recipientInClass, obj_b1 (gap_b_transfer_precedes_act v a) hs.2.2.2⟩)
  | .b2 _ v a hs =>
      .subsectionB (.b2
        ⟨corr_receiptStep hs.2.2.1 hs.2.1, covered_to_p hs.1.addressee,
         obj_b2 (gap_b_transfer_precedes_act v a) hs.2.2.2⟩)
  | .b3 _ _ v _ hs =>
      .subsectionB (.b3
        ⟨corr_transferStep hs.2.2.1 hs.2.1, corr_directed hs.2.1,
         corr_proceeding hs.1.witnessCondition, corr_conduct hs.1.witnessCondition,
         fun hsh => hs.2.2.2.2 (corr_safeHarbor hsh)⟩)
  | .b4 _ v _ hs =>
      .subsectionB (.b4
        ⟨corr_receiptStep hs.2.2.1 hs.2.1, corr_proceeding hs.1.witnessCondition,
         corr_conduct hs.1.witnessCondition, fun hsh => hs.2.2.2.2 (corr_safeHarbor hsh)⟩)
  | .c1A _ _ v a hs =>
      .subsectionC (.c1a
        ⟨corr_lawfulChannel hs.2.2.1, corr_gives hs.2.1, corr_directed hs.2.1,
         coveredFormer_to_p hs.1.recipientInClass, corr_act hs.2.2.2.1,
         Nat.le_total (Procedure.dayOfOfficialAct (mapA a) c)
           (Procedure.dayOfTransfer (mapT v) c)⟩)
  | .c1B _ v a hs =>
      .subsectionC (.c1b
        ⟨corr_lawfulChannel hs.2.2.2.1, corr_demands hs.2.1,
         coveredFormer_to_p hs.1.addressee, corr_act hs.2.2.2.2.1,
         Nat.le_total (Procedure.dayOfOfficialAct (mapA a) c)
           (Procedure.dayOfTransfer (mapT v) c)⟩)
  | .c2 _ _ v _ hs =>
      .subsectionC (.c2
        ⟨corr_gives hs.2.1, corr_directed hs.2.1, corr_proceeding hs.1.witnessCondition,
         corr_conduct hs.1.witnessCondition, fun hsh => hs.2.2.2 (corr_safeHarbor hsh)⟩)
  | .c3 _ v _ hs =>
      .subsectionC (.c3
        ⟨corr_demands hs.2.1, corr_proceeding hs.1.witnessCondition,
         corr_conduct hs.1.witnessCondition, fun hsh => hs.2.2.2.2 (corr_safeHarbor hsh)⟩)

end DP










namespace EO

axiom mapDA : Elements.OfficialAct → Ontology.DecisionOrAction
axiom mapM : Elements.OfficialAct → Ontology.Matter


axiom govUnit : Person → Ontology.GovernmentUnit

axiom offFn : Person → Ontology.OfficialFunction

axiom office : Person → Ontology.Office

axiom selEvent : Person → Ontology.SelectionEvent

axiom corr_congressional {p c} :
    Elements.IsMemberOfCongressDelegateOrResidentCommissioner p c →
    Ontology.CongressionalOfficialClass p c
axiom corr_officerEmployee {p c} : Elements.IsOfficerOrEmployeeOfUnitedStates p c →
    Ontology.FederalRoleClass p c
axiom corr_actingFor {p c} : Elements.ActsForOrOnBehalfOfUnitedStates p c →
    Ontology.FederalRoleClass p c
axiom corr_officialFunction {p c} :
    Elements.ActsInOfficialFunctionUnderGovernmentAuthority p c →
    Ontology.GovernmentUnitClass (govUnit p) c ∧ Ontology.IsOfficialFunction (offFn p) c ∧
      Ontology.ActsInOfficialFunction p (offFn p) c ∧
      Ontology.ActsUnderOrByAuthorityOfGovernmentUnit p (govUnit p) c
axiom corr_juror {p c} : Elements.IsJuror p c → Ontology.IsJuror p c
axiom corr_nominated {p c} : Elements.HasBeenNominatedToBePublicOfficial p c →
    Ontology.IsNominationEvent (selEvent p) c
axiom corr_appointed {p c} : Elements.HasBeenAppointedToBePublicOfficial p c →
    Ontology.IsAppointmentEvent (selEvent p) c
axiom corr_informed {p c} : Elements.HasBeenOfficiallyInformedOfSelection p c →
    Ontology.IsOfficialInformingOfProspectiveSelection (selEvent p) c
axiom corr_selectionFrame {p c} : Elements.IsPersonSelectedToBePublicOfficial p c →
    Ontology.IsPublicOfficialPost (office p) c ∧
      Ontology.SelectionEventNamesPerson (selEvent p) p c ∧
      Ontology.SelectionEventTargetsPost (selEvent p) (office p) c
axiom corr_decision {act c} : Elements.IsDecisionOrActionOnQuestionOrMatter act c →
    Ontology.DecisionOrActionClass (mapDA act) c ∧
      Ontology.DecisionOrActionOnMatter (mapDA act) (mapM act) c ∧
      Ontology.QualifyingMatterClass (mapM act) c
axiom corr_pendency {act p c} : Elements.MatterPendingOrMayByLawBeBrought act c →
    Ontology.PendencyBeforeOfficialClass (mapM act) p c
axiom corr_capacity {act p c} : Elements.WithinOfficialCapacityOrPlaceOfTrust act c →
    Ontology.OfficialCapacityClass p c



theorem s201a1_elements_implies_ontology {p c} (h : Elements.IsPublicOfficial p c) :
    Ontology.PublicOfficialClass p c :=
  match h with
  | .congressional h => .congressional (corr_congressional h)
  | .federalCapacity h =>
      .functionary (govUnit p) (offFn p)
        ⟨(match h.capacity with
          | .officerOrEmployee hh => corr_officerEmployee hh
          | .actingForUnitedStates hh => corr_actingFor hh),
         (corr_officialFunction h.officialFunction).1,
         (corr_officialFunction h.officialFunction).2.1,
         (corr_officialFunction h.officialFunction).2.2.1,
         (corr_officialFunction h.officialFunction).2.2.2⟩
  | .juror h => .juror (corr_juror h)


theorem s201a2_elements_implies_ontology {p c}
    (h : Elements.IsPersonSelectedToBePublicOfficial p c) :
    Ontology.SelectedToBePublicOfficial p (office p) (selEvent p) c :=
  ⟨(corr_selectionFrame h).1, (corr_selectionFrame h).2.1, (corr_selectionFrame h).2.2,
   (match h with
    | .nominated hh => .nominated (corr_nominated hh)
    | .appointed hh => .appointed (corr_appointed hh)
    | .officiallyInformed hh => .officiallyInformed (corr_informed hh))⟩





theorem s201a3_elements_implies_ontology {act p c}
    (hp : Ontology.PublicOfficialClass p c) (h : Elements.IsOfficialAct act c) :
    Ontology.OfficialAct (mapDA act) (mapM act) p c :=
  ⟨(corr_decision h.decisionOrAction).1, (corr_decision h.decisionOrAction).2.1,
   (corr_decision h.decisionOrAction).2.2, corr_pendency h.pendingOrBringable, hp,
   corr_capacity h.officialCapacity⟩

end EO












namespace DO

axiom mapDA : Deontic.OfficialAct → Ontology.DecisionOrAction
axiom mapM : Deontic.OfficialAct → Ontology.Matter

axiom corr_publicOfficial {p c} : Deontic.IsPublicOfficial p c → Ontology.PublicOfficialClass p c
axiom corr_officialAct {a p c} : Deontic.IsOfficialAct a c → Ontology.PublicOfficialClass p c →
    Ontology.OfficialAct (mapDA a) (mapM a) p c


theorem s201a1_deontic_implies_ontology {p c} (h : Deontic.IsPublicOfficial p c) :
    Ontology.PublicOfficialClass p c :=
  corr_publicOfficial h


theorem s201a3_deontic_implies_ontology {a p c}
    (hp : Ontology.PublicOfficialClass p c) (h : Deontic.IsOfficialAct a c) :
    Ontology.OfficialAct (mapDA a) (mapM a) p c :=
  corr_officialAct h hp

end DO










namespace PO

axiom mapDA : Procedure.OfficialAct → Ontology.DecisionOrAction
axiom mapM : Procedure.Matter → Ontology.Matter
axiom govUnit : Person → Ontology.GovernmentUnit
axiom offFn : Person → Ontology.OfficialFunction

axiom corr_enumerated {p c} : Procedure.HoldsEnumeratedFederalPosition p c →
    Ontology.CongressionalOfficialClass p c ∨ Ontology.IsJuror p c
axiom corr_serves {p c} : Procedure.ServesInFederalOfficialFunction p c →
    Ontology.FederalFunctionaryOfficial p (govUnit p) (offFn p) c
axiom corr_decisionOnMatter {a m c} : Procedure.DecisionOrActionOnMatter a m c →
    Ontology.DecisionOrActionClass (mapDA a) c ∧
      Ontology.DecisionOrActionOnMatter (mapDA a) (mapM m) c ∧
      Ontology.QualifyingMatterClass (mapM m) c
axiom corr_pending {m p c} : Procedure.MatterPendingBeforeOfficial m p c →
    Ontology.MayAtAnyTimeBePendingBeforeOfficial (mapM m) p c
axiom corr_mayBeBrought {m p c} : Procedure.MatterMayByLawBeBroughtBeforeOfficial m p c →
    Ontology.MayByLawBeBroughtBeforeOfficial (mapM m) p c
axiom corr_capacity {a p c} : Procedure.ActTakenInOfficialCapacityOrPlaceOfTrust a p c →
    Ontology.OfficialCapacityClass p c


theorem s201a1_procedure_implies_ontology {p c} (h : Procedure.PublicOfficialStatus p c) :
    Ontology.PublicOfficialClass p c :=
  match h with
  | .enumeratedPosition hh =>
      (match corr_enumerated hh with
       | Or.inl hc => .congressional hc
       | Or.inr hj => .juror hj)
  | .officialFunction hh => .functionary (govUnit p) (offFn p) (corr_serves hh)


theorem s201a3_procedure_implies_ontology {a m p c}
    (hp : Ontology.PublicOfficialClass p c) (h : Procedure.QualifyingOfficialAct a m p c) :
    Ontology.OfficialAct (mapDA a) (mapM m) p c :=
  ⟨(corr_decisionOnMatter h.decisionOrAction).1,
   (corr_decisionOnMatter h.decisionOrAction).2.1,
   (corr_decisionOnMatter h.decisionOrAction).2.2,
   (match h.cognizable with
    | .pending hh => .mayBePending (corr_pending hh)
    | .mayBeBrought hh => .mayByLawBeBrought (corr_mayBeBrought hh)),
   hp, corr_capacity h.capacity⟩

end PO












namespace ES

axiom corr_corruptly {p c} : Elements.ActsCorruptly p c → Scienter.ActsCorruptly p c
axiom corr_b1A {payor official act c} :
    Elements.IntentToInfluenceOfficialAct payor official act c →
    Scienter.ReachesParagraphRung payor Scienter.Paragraph201.b1A c ∧
      Scienter.IntendsToInfluenceOfficialAct payor c
axiom corr_b1B {payor official c} :
    Elements.IntentToInduceFraudOnTheUnitedStates payor official c →
    Scienter.ReachesParagraphRung payor Scienter.Paragraph201.b1B c ∧
      Scienter.IntendsToInduceFraudOnUnitedStates payor c
axiom corr_b1C {payor official c} :
    Elements.IntentToInduceViolationOfLawfulDuty payor official c →
    Scienter.ReachesParagraphRung payor Scienter.Paragraph201.b1C c ∧
      Scienter.IntendsToInduceBreachOfLawfulDuty payor c
axiom corr_notLawful {v official payor c} :
    ¬ Elements.AuthorizedByLawForProperDischargeOfOfficialDuty v official c →
    Scienter.NotAuthorizedByLawForProperDischargeOfDuty payor c


theorem s201b1_elements_implies_scienter {payor official v act c}
    (h : Elements.Section201b1 payor official v act c) : Scienter.Scienter201b1 payor c :=
  ⟨corr_corruptly h.corruptly,
   (match h.intent with
    | .influenceOfficialAct hh => .influenceOfficialAct ⟨(corr_b1A hh.intent).1, (corr_b1A hh.intent).2⟩
    | .fraudOnUnitedStates hh => .fraudOnUnitedStates ⟨(corr_b1B hh).1, (corr_b1B hh).2⟩
    | .violationOfLawfulDuty hh => .breachOfLawfulDuty ⟨(corr_b1C hh).1, (corr_b1C hh).2⟩)⟩










theorem s201c1A_elements_implies_scienter_modulo_gaps {payor official v act c}
    (gap_c1_knowledge_rung : Scienter.ReachesParagraphRung payor Scienter.Paragraph201.c1A c)
    (gap_c1_knows_nexus : Scienter.KnowsValueIsForOrBecauseOfOfficialAct payor c)
    (h : Elements.Section201c1A payor official v act c) : Scienter.Scienter201c1A payor c :=
  ⟨gap_c1_knowledge_rung, gap_c1_knows_nexus, corr_notLawful h.notAuthorizedByLaw⟩

end ES





namespace DS

axiom corr_corruptly {p c} : Deontic.ActsCorruptly p c → Scienter.ActsCorruptly p c
axiom corr_b1A {giver a c} : Deontic.IntentToInfluenceOfficialAct giver a c →
    Scienter.ReachesParagraphRung giver Scienter.Paragraph201.b1A c ∧
      Scienter.IntendsToInfluenceOfficialAct giver c
axiom corr_b1B {giver recip c} :
    Deontic.IntentToInfluenceCommissionOfFraudOnUnitedStates giver recip c →
    Scienter.ReachesParagraphRung giver Scienter.Paragraph201.b1B c ∧
      Scienter.IntendsToInduceFraudOnUnitedStates giver c
axiom corr_b1C {giver recip c} : Deontic.IntentToInduceViolationOfLawfulDuty giver recip c →
    Scienter.ReachesParagraphRung giver Scienter.Paragraph201.b1C c ∧
      Scienter.IntendsToInduceBreachOfLawfulDuty giver c
axiom corr_notLawful {v giver c} :
    Deontic.OtherwiseThanAsProvidedByLawForProperDischargeOfOfficialDuty v c →
    Scienter.NotAuthorizedByLawForProperDischargeOfDuty giver c


theorem s201b1_deontic_implies_scienter {giver recip v a c}
    (h : Deontic.ProhibitionViolated201b1 giver recip v a c) : Scienter.Scienter201b1 giver c :=
  ⟨corr_corruptly h.2.2.1,
   (match h.2.2.2 with
    | .influenceOfficialAct _ hi => .influenceOfficialAct ⟨(corr_b1A hi).1, (corr_b1A hi).2⟩
    | .influenceFraudOnUnitedStates hi => .fraudOnUnitedStates ⟨(corr_b1B hi).1, (corr_b1B hi).2⟩
    | .induceViolationOfLawfulDuty hi => .breachOfLawfulDuty ⟨(corr_b1C hi).1, (corr_b1C hi).2⟩)⟩





theorem s201c1A_deontic_implies_scienter_modulo_gaps {giver recip v a c}
    (gap_c1_knowledge_rung : Scienter.ReachesParagraphRung giver Scienter.Paragraph201.c1A c)
    (gap_c1_knows_nexus : Scienter.KnowsValueIsForOrBecauseOfOfficialAct giver c)
    (h : Deontic.ProhibitionViolated201c1A giver recip v a c) : Scienter.Scienter201c1A giver c :=
  ⟨gap_c1_knowledge_rung, gap_c1_knows_nexus, corr_notLawful h.2.2.1⟩

end DS










namespace PS

axiom corr_corruptly {t p c} : Procedure.CorruptlyGivesOffersOrPromises t p c →
    Scienter.ActsCorruptly p c
axiom corr_b1A {t payor a m recip c} : Procedure.CorruptlyGivesOffersOrPromises t payor c →
    Procedure.QualifyingOfficialAct a m recip c →
    Scienter.ReachesParagraphRung payor Scienter.Paragraph201.b1A c ∧
      Scienter.IntendsToInfluenceOfficialAct payor c
axiom corr_b1B {t payor c} : Procedure.CorruptlyGivesOffersOrPromises t payor c →
    Procedure.ObjectIsFraudOnUnitedStates t c →
    Scienter.ReachesParagraphRung payor Scienter.Paragraph201.b1B c ∧
      Scienter.IntendsToInduceFraudOnUnitedStates payor c
axiom corr_b1C {t payor c} : Procedure.CorruptlyGivesOffersOrPromises t payor c →
    Procedure.ObjectIsActInViolationOfLawfulDuty t c →
    Scienter.ReachesParagraphRung payor Scienter.Paragraph201.b1C c ∧
      Scienter.IntendsToInduceBreachOfLawfulDuty payor c
axiom corr_notLawful {t payor c} : ¬ Procedure.AuthorizedByLawForProperDischargeOfDuty t c →
    Scienter.NotAuthorizedByLawForProperDischargeOfDuty payor c


theorem s201b1_procedure_implies_scienter {t payor recip c}
    (h : Procedure.RouteB1 t payor recip c) : Scienter.Scienter201b1 payor c :=
  ⟨corr_corruptly h.transferStep,
   (match h.object with
    | .officialAct ha _ =>
        .influenceOfficialAct ⟨(corr_b1A h.transferStep ha).1, (corr_b1A h.transferStep ha).2⟩
    | .fraudOnUnitedStates hf =>
        .fraudOnUnitedStates ⟨(corr_b1B h.transferStep hf).1, (corr_b1B h.transferStep hf).2⟩
    | .dutyViolation hd =>
        .breachOfLawfulDuty ⟨(corr_b1C h.transferStep hd).1, (corr_b1C h.transferStep hd).2⟩)⟩



theorem s201c1A_procedure_implies_scienter_modulo_gaps {t payor recip a m c}
    (gap_c1_knowledge_rung : Scienter.ReachesParagraphRung payor Scienter.Paragraph201.c1A c)
    (gap_c1_knows_nexus : Scienter.KnowsValueIsForOrBecauseOfOfficialAct payor c)
    (h : Procedure.RouteC1A t payor recip a m c) : Scienter.Scienter201c1A payor c :=
  ⟨gap_c1_knowledge_rung, gap_c1_knows_nexus, corr_notLawful h.outsideLawfulChannel⟩

end PS





















namespace Golden



opaque Section201Act : Type

axiom actOf : Section201Act → Proving.Rico.Act
axiom mapComplaint : ComplaintText → Proving.Rico.ComplaintText




axiom corr_s201_named_in_1961B {a : Section201Act} {c : ComplaintText} :
    Elements.ViolatesSection201 c →
    Proving.Rico.IsRacketeeringActivity (actOf a) (mapComplaint c)




theorem s201_elements_implies_golden_1961B {a : Section201Act} {c : ComplaintText}
    (h : Elements.ViolatesSection201 c) :
    Proving.Rico.IsRacketeeringActivity (actOf a) (mapComplaint c) :=
  corr_s201_named_in_1961B h

end Golden

end Proving.USC.T18.Ch11.EchoReslice.Bridge










import Proving.USC.T18.Ch11.EchoReslice.Deontic.Types
import Proving.USC.T18.Ch11.EchoReslice.Deontic.Predicates
import Proving.USC.T18.Ch11.EchoReslice.Deontic.Statute

set_option autoImplicit false

namespace Proving.USC.T18.Ch11.EchoReslice.Deontic

open Proving.USC.Common (Person ComplaintText)



theorem term201a1PublicOfficial_intro {p : Person} {c : ComplaintText}
    (h : IsPublicOfficial p c) : Term201a1PublicOfficial p c := h

theorem term201a2SelectedOfficial_intro {p : Person} {c : ComplaintText}
    (h : IsPersonSelectedToBePublicOfficial p c) : Term201a2SelectedOfficial p c := h

theorem term201a3OfficialAct_intro {a : OfficialAct} {c : ComplaintText}
    (h : IsOfficialAct a c) : Term201a3OfficialAct a c := h



theorem officialOrSelectee_intro_official {p : Person} {c : ComplaintText}
    (h : IsPublicOfficial p c) : OfficialOrSelectee p c := Or.inl h

theorem officialOrSelectee_intro_selectee {p : Person} {c : ComplaintText}
    (h : IsPersonSelectedToBePublicOfficial p c) : OfficialOrSelectee p c := Or.inr h

theorem officialFormerOrSelectee_intro_official {p : Person} {c : ComplaintText}
    (h : IsPublicOfficial p c) : OfficialFormerOrSelectee p c := Or.inl h

theorem officialFormerOrSelectee_intro_former {p : Person} {c : ComplaintText}
    (h : IsFormerPublicOfficial p c) : OfficialFormerOrSelectee p c := Or.inr (Or.inl h)

theorem officialFormerOrSelectee_intro_selectee {p : Person} {c : ComplaintText}
    (h : IsPersonSelectedToBePublicOfficial p c) : OfficialFormerOrSelectee p c :=
  Or.inr (Or.inr h)



theorem prohibition201b1_intro {giver recipient : Person} {c : ComplaintText}
    (hAddr : AddresseeWhoever giver c) (hRecip : OfficialOrSelectee recipient c) :
    Prohibition201b1 giver recipient c := ⟨hAddr, hRecip⟩

theorem intent201b1_influenceOfficialAct_intro {giver recipient : Person}
    {a : OfficialAct} {c : ComplaintText}
    (hAct : IsOfficialAct a c) (hIntent : IntentToInfluenceOfficialAct giver a c) :
    Intent201b1 giver recipient a c := .influenceOfficialAct hAct hIntent

theorem intent201b1_influenceFraudOnUnitedStates_intro {giver recipient : Person}
    {a : OfficialAct} {c : ComplaintText}
    (hIntent : IntentToInfluenceCommissionOfFraudOnUnitedStates giver recipient c) :
    Intent201b1 giver recipient a c := .influenceFraudOnUnitedStates hIntent

theorem intent201b1_induceViolationOfLawfulDuty_intro {giver recipient : Person}
    {a : OfficialAct} {c : ComplaintText}
    (hIntent : IntentToInduceViolationOfLawfulDuty giver recipient c) :
    Intent201b1 giver recipient a c := .induceViolationOfLawfulDuty hIntent

theorem prohibitionViolated201b1_intro {giver recipient : Person} {v : ThingOfValue}
    {a : OfficialAct} {c : ComplaintText}
    (hFrame : Prohibition201b1 giver recipient c)
    (hGive : GivesOffersOrPromisesThingOfValue giver recipient v c)
    (hCorrupt : ActsCorruptly giver c)
    (hIntent : Intent201b1 giver recipient a c) :
    ProhibitionViolated201b1 giver recipient v a c :=
  ⟨hFrame, hGive, hCorrupt, hIntent⟩



theorem prohibition201b2_intro {taker : Person} {c : ComplaintText}
    (hAddr : OfficialOrSelectee taker c) : Prohibition201b2 taker c := ⟨hAddr⟩

theorem returnFor201b2_influencedInOfficialAct_intro {taker : Person}
    {a : OfficialAct} {c : ComplaintText}
    (hAct : IsOfficialAct a c)
    (hReturn : InReturnForBeingInfluencedInOfficialAct taker a c) :
    ReturnFor201b2 taker a c := .influencedInOfficialAct hAct hReturn

theorem returnFor201b2_influencedToCommitFraudOnUnitedStates_intro {taker : Person}
    {a : OfficialAct} {c : ComplaintText}
    (hReturn : InReturnForBeingInfluencedToCommitFraudOnUnitedStates taker c) :
    ReturnFor201b2 taker a c := .influencedToCommitFraudOnUnitedStates hReturn

theorem returnFor201b2_inducedToViolateOfficialDuty_intro {taker : Person}
    {a : OfficialAct} {c : ComplaintText}
    (hReturn : InReturnForBeingInducedToViolateOfficialDuty taker c) :
    ReturnFor201b2 taker a c := .inducedToViolateOfficialDuty hReturn

theorem prohibitionViolated201b2_intro {taker : Person} {v : ThingOfValue}
    {a : OfficialAct} {c : ComplaintText}
    (hFrame : Prohibition201b2 taker c)
    (hTake : DemandsSeeksReceivesOrAcceptsThingOfValue taker v c)
    (hCorrupt : ActsCorruptly taker c)
    (hReturn : ReturnFor201b2 taker a c) :
    ProhibitionViolated201b2 taker v a c :=
  ⟨hFrame, hTake, hCorrupt, hReturn⟩



theorem prohibition201b3_intro {giver witness : Person} {pr : Proceeding}
    {c : ComplaintText}
    (hAddr : AddresseeWhoever giver c)
    (hWitness : IsWitnessInFederalProceeding witness pr c) :
    Prohibition201b3 giver witness pr c := ⟨hAddr, hWitness⟩

theorem intent201b3_influenceTestimony_intro {giver witness : Person}
    {pr : Proceeding} {c : ComplaintText}
    (h : IntentToInfluenceTestimony giver witness pr c) :
    Intent201b3 giver witness pr c := .influenceTestimony h

theorem intent201b3_induceAbsence_intro {giver witness : Person}
    {pr : Proceeding} {c : ComplaintText}
    (h : IntentToInduceAbsenceFromProceeding giver witness pr c) :
    Intent201b3 giver witness pr c := .induceAbsence h

theorem prohibitionViolated201b3_intro {giver witness : Person} {v : ThingOfValue}
    {pr : Proceeding} {c : ComplaintText}
    (hFrame : Prohibition201b3 giver witness pr c)
    (hGive : GivesOffersOrPromisesThingOfValue giver witness v c)
    (hCorrupt : ActsCorruptly giver c)
    (hIntent : Intent201b3 giver witness pr c)
    (hNoExempt : ¬ WitnessFeeOrExpenseExemptionApplies v pr c) :
    ProhibitionViolated201b3 giver witness v pr c :=
  ⟨hFrame, hGive, hCorrupt, hIntent, hNoExempt⟩



theorem prohibition201b4_intro {taker : Person} {pr : Proceeding} {c : ComplaintText}
    (hAddr : AddresseeWhoever taker c)
    (hWitness : IsWitnessInFederalProceeding taker pr c) :
    Prohibition201b4 taker pr c := ⟨hAddr, hWitness⟩

theorem returnFor201b4_influencedInTestimony_intro {taker : Person}
    {pr : Proceeding} {c : ComplaintText}
    (h : InReturnForBeingInfluencedInTestimony taker pr c) :
    ReturnFor201b4 taker pr c := .influencedInTestimony h

theorem returnFor201b4_absentingFromProceeding_intro {taker : Person}
    {pr : Proceeding} {c : ComplaintText}
    (h : InReturnForAbsentingFromProceeding taker pr c) :
    ReturnFor201b4 taker pr c := .absentingFromProceeding h

theorem prohibitionViolated201b4_intro {taker : Person} {v : ThingOfValue}
    {pr : Proceeding} {c : ComplaintText}
    (hFrame : Prohibition201b4 taker pr c)
    (hTake : DemandsSeeksReceivesOrAcceptsThingOfValue taker v c)
    (hCorrupt : ActsCorruptly taker c)
    (hReturn : ReturnFor201b4 taker pr c)
    (hNoExempt : ¬ WitnessFeeOrExpenseExemptionApplies v pr c) :
    ProhibitionViolated201b4 taker v pr c :=
  ⟨hFrame, hTake, hCorrupt, hReturn, hNoExempt⟩



theorem prohibition201c1A_intro {giver recipient : Person} {c : ComplaintText}
    (hAddr : AddresseeWhoever giver c)
    (hRecip : OfficialFormerOrSelectee recipient c) :
    Prohibition201c1A giver recipient c := ⟨hAddr, hRecip⟩

theorem prohibitionViolated201c1A_intro {giver recipient : Person} {v : ThingOfValue}
    {a : OfficialAct} {c : ComplaintText}
    (hFrame : Prohibition201c1A giver recipient c)
    (hGive : GivesOffersOrPromisesThingOfValue giver recipient v c)
    (hOutsideLaw : OtherwiseThanAsProvidedByLawForProperDischargeOfOfficialDuty v c)
    (hOfficialAct : IsOfficialAct a c)
    (hNexus : ForOrBecauseOfOfficialActPerformedOrToBePerformed v a c) :
    ProhibitionViolated201c1A giver recipient v a c :=
  ⟨hFrame, hGive, hOutsideLaw, hOfficialAct, hNexus⟩



theorem prohibition201c1B_intro {taker : Person} {c : ComplaintText}
    (hAddr : OfficialFormerOrSelectee taker c) : Prohibition201c1B taker c := ⟨hAddr⟩

theorem prohibitionViolated201c1B_intro {taker : Person} {v : ThingOfValue}
    {a : OfficialAct} {c : ComplaintText}
    (hFrame : Prohibition201c1B taker c)
    (hTake : DemandsSeeksReceivesOrAcceptsThingOfValue taker v c)
    (hPersonally : ReceivesThingOfValuePersonally taker v c)
    (hOutsideLaw : OtherwiseThanAsProvidedByLawForProperDischargeOfOfficialDuty v c)
    (hOfficialAct : IsOfficialAct a c)
    (hNexus : ForOrBecauseOfOfficialActPerformedOrToBePerformed v a c) :
    ProhibitionViolated201c1B taker v a c :=
  ⟨hFrame, hTake, hPersonally, hOutsideLaw, hOfficialAct, hNexus⟩



theorem prohibition201c2_intro {giver witness : Person} {pr : Proceeding}
    {c : ComplaintText}
    (hAddr : AddresseeWhoever giver c)
    (hWitness : IsWitnessInFederalProceeding witness pr c) :
    Prohibition201c2 giver witness pr c := ⟨hAddr, hWitness⟩

theorem prohibitionViolated201c2_intro {giver witness : Person} {v : ThingOfValue}
    {pr : Proceeding} {c : ComplaintText}
    (hFrame : Prohibition201c2 giver witness pr c)
    (hGive : GivesOffersOrPromisesThingOfValue giver witness v c)
    (hNexus : ForOrBecauseOfTestimonyOrAbsence v pr c)
    (hNoExempt : ¬ WitnessFeeOrExpenseExemptionApplies v pr c) :
    ProhibitionViolated201c2 giver witness v pr c :=
  ⟨hFrame, hGive, hNexus, hNoExempt⟩



theorem prohibition201c3_intro {taker : Person} {pr : Proceeding} {c : ComplaintText}
    (hAddr : AddresseeWhoever taker c)
    (hWitness : IsWitnessInFederalProceeding taker pr c) :
    Prohibition201c3 taker pr c := ⟨hAddr, hWitness⟩

theorem prohibitionViolated201c3_intro {taker : Person} {v : ThingOfValue}
    {pr : Proceeding} {c : ComplaintText}
    (hFrame : Prohibition201c3 taker pr c)
    (hTake : DemandsSeeksReceivesOrAcceptsThingOfValue taker v c)
    (hPersonally : ReceivesThingOfValuePersonally taker v c)
    (hNexus : ForOrBecauseOfTestimonyOrAbsence v pr c)
    (hNoExempt : ¬ WitnessFeeOrExpenseExemptionApplies v pr c) :
    ProhibitionViolated201c3 taker v pr c :=
  ⟨hFrame, hTake, hPersonally, hNexus, hNoExempt⟩



theorem obligation201bPenalty_intro {defendant : Person} {c : ComplaintText}
    (hConv : ConvictedUnderSubsectionB defendant c) :
    Obligation201bPenalty defendant c := ⟨hConv⟩

theorem obligationBreached201bPenalty_intro {defendant : Person} {c : ComplaintText}
    (hFrame : Obligation201bPenalty defendant c)
    (hNoSanction : ¬ FineOrImprisonmentImposed defendant c) :
    ObligationBreached201bPenalty defendant c := ⟨hFrame, hNoSanction⟩

theorem sentenceWithinStatutoryMaximum201b_intro {defendant : Person}
    {v : ThingOfValue} {c : ComplaintText}
    (hFine : fineImposed defendant c ≤
        max (titleEighteenFineCap defendant c) (3 * monetaryEquivalentOfThingOfValue v c))
    (hTerm : monthsOfImprisonmentImposed defendant c ≤ 180) :
    SentenceWithinStatutoryMaximum201b defendant v c := ⟨hFine, hTerm⟩

theorem power201bDisqualification_intro {defendant : Person} {o : Office}
    {c : ComplaintText}
    (hConv : ConvictedUnderSubsectionB defendant c)
    (hOffice : IsOfficeOfHonorTrustOrProfitUnderUnitedStates o c) :
    Power201bDisqualification defendant o c := ⟨hConv, hOffice⟩

theorem powerExercised201bDisqualification_intro {defendant : Person} {o : Office}
    {c : ComplaintText}
    (hFrame : Power201bDisqualification defendant o c)
    (hImposed : DisqualificationFromOfficeImposed defendant o c) :
    PowerExercised201bDisqualification defendant o c := ⟨hFrame, hImposed⟩

theorem obligation201cPenalty_intro {defendant : Person} {c : ComplaintText}
    (hConv : ConvictedUnderSubsectionC defendant c) :
    Obligation201cPenalty defendant c := ⟨hConv⟩

theorem obligationBreached201cPenalty_intro {defendant : Person} {c : ComplaintText}
    (hFrame : Obligation201cPenalty defendant c)
    (hNoSanction : ¬ FineOrImprisonmentImposed defendant c) :
    ObligationBreached201cPenalty defendant c := ⟨hFrame, hNoSanction⟩

theorem sentenceWithinStatutoryMaximum201c_intro {defendant : Person}
    {c : ComplaintText}
    (hTerm : monthsOfImprisonmentImposed defendant c ≤ 24) :
    SentenceWithinStatutoryMaximum201c defendant c := hTerm



theorem permission201d_intro {v : ThingOfValue} {pr : Proceeding} {c : ComplaintText}
    (hExempt : WitnessFeeOrExpenseExemptionApplies v pr c) :
    Permission201d v pr c := ⟨hExempt⟩

theorem permissionAvailable201d_intro {v : ThingOfValue} {pr : Proceeding}
    {c : ComplaintText}
    (hFrame : Permission201d v pr c) : PermissionAvailable201d v pr c := hFrame

theorem permission201e_intro {defendant : Person} {c : ComplaintText}
    (hThis : PunishedUnderThisSection defendant c)
    (hCompanion : PunishedUnderSection1503Or1504Or1505 defendant c) :
    Permission201e defendant c := ⟨hThis, hCompanion⟩

theorem permissionExercised201e_intro {defendant : Person} {c : ComplaintText}
    (hFrame : Permission201e defendant c) : PermissionExercised201e defendant c :=
  hFrame











theorem s201d_exemption_precludes_201b3 {giver witness : Person} {v : ThingOfValue}
    {pr : Proceeding} {c : ComplaintText}
    (hExempt : WitnessFeeOrExpenseExemptionApplies v pr c) :
    ¬ ProhibitionViolated201b3 giver witness v pr c :=
  fun hv => hv.2.2.2.2 hExempt


theorem s201d_exemption_precludes_201b4 {taker : Person} {v : ThingOfValue}
    {pr : Proceeding} {c : ComplaintText}
    (hExempt : WitnessFeeOrExpenseExemptionApplies v pr c) :
    ¬ ProhibitionViolated201b4 taker v pr c :=
  fun hv => hv.2.2.2.2 hExempt


theorem s201d_exemption_precludes_201c2 {giver witness : Person} {v : ThingOfValue}
    {pr : Proceeding} {c : ComplaintText}
    (hExempt : WitnessFeeOrExpenseExemptionApplies v pr c) :
    ¬ ProhibitionViolated201c2 giver witness v pr c :=
  fun hv => hv.2.2.2 hExempt


theorem s201d_exemption_precludes_201c3 {taker : Person} {v : ThingOfValue}
    {pr : Proceeding} {c : ComplaintText}
    (hExempt : WitnessFeeOrExpenseExemptionApplies v pr c) :
    ¬ ProhibitionViolated201c3 taker v pr c :=
  fun hv => hv.2.2.2.2 hExempt



theorem section201Violated_b1_intro {giver recipient : Person} {v : ThingOfValue}
    {a : OfficialAct} {c : ComplaintText}
    (h : ProhibitionViolated201b1 giver recipient v a c) : Section201Violated c :=
  .b1 giver recipient v a h

theorem section201Violated_b2_intro {taker : Person} {v : ThingOfValue}
    {a : OfficialAct} {c : ComplaintText}
    (h : ProhibitionViolated201b2 taker v a c) : Section201Violated c :=
  .b2 taker v a h

theorem section201Violated_b3_intro {giver witness : Person} {v : ThingOfValue}
    {pr : Proceeding} {c : ComplaintText}
    (h : ProhibitionViolated201b3 giver witness v pr c) : Section201Violated c :=
  .b3 giver witness v pr h

theorem section201Violated_b4_intro {taker : Person} {v : ThingOfValue}
    {pr : Proceeding} {c : ComplaintText}
    (h : ProhibitionViolated201b4 taker v pr c) : Section201Violated c :=
  .b4 taker v pr h

theorem section201Violated_c1A_intro {giver recipient : Person} {v : ThingOfValue}
    {a : OfficialAct} {c : ComplaintText}
    (h : ProhibitionViolated201c1A giver recipient v a c) : Section201Violated c :=
  .c1A giver recipient v a h

theorem section201Violated_c1B_intro {taker : Person} {v : ThingOfValue}
    {a : OfficialAct} {c : ComplaintText}
    (h : ProhibitionViolated201c1B taker v a c) : Section201Violated c :=
  .c1B taker v a h

theorem section201Violated_c2_intro {giver witness : Person} {v : ThingOfValue}
    {pr : Proceeding} {c : ComplaintText}
    (h : ProhibitionViolated201c2 giver witness v pr c) : Section201Violated c :=
  .c2 giver witness v pr h

theorem section201Violated_c3_intro {taker : Person} {v : ThingOfValue}
    {pr : Proceeding} {c : ComplaintText}
    (h : ProhibitionViolated201c3 taker v pr c) : Section201Violated c :=
  .c3 taker v pr h

end Proving.USC.T18.Ch11.EchoReslice.Deontic

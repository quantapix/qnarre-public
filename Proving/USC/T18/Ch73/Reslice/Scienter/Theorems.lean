






import Proving.USC.T18.Ch73.Reslice.Scienter.Statute

set_option autoImplicit false

namespace Proving.USC.T18.Ch73.Reslice.Scienter

open Proving.USC.Common (Person ComplaintText)



theorem mentalState_atLeast_refl (a : MentalState) : a.atLeast a :=
  Nat.le_refl _

theorem mentalState_atLeast_trans {a b d : MentalState}
    (hab : a.atLeast b) (hbd : b.atLeast d) : a.atLeast d :=
  Nat.le_trans hbd hab


theorem mentalState_specific_atLeast (m : MentalState) : MentalState.Specific.atLeast m := by
  cases m <;> decide


theorem mentalState_atLeast_strictLiability (m : MentalState) :
    m.atLeast MentalState.StrictLiability := by
  cases m <;> decide





theorem satisfiedBy_strictLiability (p : Person) (cl : Clause) (c : ComplaintText) :
    (ScienterDemand.Requires MentalState.StrictLiability).SatisfiedBy p cl c :=
  trivial

theorem satisfiedBy_of_atLeast {p : Person} {cl : Clause} {c : ComplaintText}
    {m rung : MentalState} (hReach : rung.atLeast m)
    (hProv : MentalStateProven p cl rung c) :
    (ScienterDemand.Requires m).SatisfiedBy p cl c := by
  cases m
  · trivial
  all_goals exact ⟨rung, hReach, hProv⟩

theorem satisfiedBy_unspecified {p : Person} {cl : Clause} {c : ComplaintText}
    {rung : MentalState} (hProv : MentalStateProven p cl rung c) :
    ScienterDemand.Unspecified.SatisfiedBy p cl c :=
  ⟨rung, hProv⟩

theorem clauseCulpable_intro {p : Person} {cl : Clause} {c : ComplaintText}
    {m rung : MentalState} (hReq : requiredMentalState cl = .Requires m)
    (hReach : rung.atLeast m) (hProv : MentalStateProven p cl rung c) :
    ClauseCulpable cl p c := by
  show (requiredMentalState cl).SatisfiedBy p cl c
  rw [hReq]
  exact satisfiedBy_of_atLeast hReach hProv

theorem clauseCulpable_unspecified_intro {p : Person} {cl : Clause} {c : ComplaintText}
    {rung : MentalState} (hReq : requiredMentalState cl = .Unspecified)
    (hProv : MentalStateProven p cl rung c) : ClauseCulpable cl p c := by
  show (requiredMentalState cl).SatisfiedBy p cl c
  rw [hReq]
  exact ⟨rung, hProv⟩



theorem requiredMentalState_s1512bConduct :
    requiredMentalState .S1512bConduct = .Requires .Knowledge := rfl

theorem requiredMentalState_s1512bObjective :
    requiredMentalState .S1512bObjective = .Requires .Specific := rfl

theorem requiredMentalState_s1512dResult :
    requiredMentalState .S1512dResult = .Requires .StrictLiability := rfl

theorem requiredMentalState_s1512gFederalNexus :
    requiredMentalState .S1512gFederalNexus = .Requires .StrictLiability := rfl

theorem requiredMentalState_s1512c2_unspecified :
    requiredMentalState .S1512c2 = .Unspecified := rfl

theorem requiredMentalState_s1512kConspiracy_unspecified :
    requiredMentalState .S1512kConspiracy = .Unspecified := rfl

theorem addresseeOf_s1512a2Bii_isInducedPerson :
    addresseeOf .S1512a2Bii = .PersonInduced := rfl

theorem addresseeOf_s1512b2B_isInducedPerson :
    addresseeOf .S1512b2B = .PersonInduced := rfl

theorem polarityOf_s1512eDefense_isExculpatory :
    polarityOf .S1512eDefense = .Exculpatory := rfl

theorem burdenOf_s1512eDefense_onDefendantByPreponderance :
    burdenOf .S1512eDefense = { bearer := .Defendant, standard := .Preponderance } := rfl



theorem federalNexusScienter_holds (p : Person) (c : ComplaintText) :
    FederalNexusScienter p c :=
  trivial


theorem s1512dResult_needsNoProvedState (p : Person) (c : ComplaintText) :
    ClauseCulpable .S1512dResult p c :=
  trivial



theorem misleadingProngScienter_falseStatement_intro {p : Person} {c : ComplaintText}
    (h : ClauseCulpable .S1515a3A p c) :
    MisleadingProngScienter .FalseStatement p c := h

theorem misleadingProngScienter_omissionOrConcealment_intro {p : Person} {c : ComplaintText}
    (h : ClauseCulpable .S1515a3B p c) :
    MisleadingProngScienter .OmissionOrConcealment p c := h

theorem misleadingProngScienter_writingOrRecording_intro {p : Person} {c : ComplaintText}
    (hKnow : ClauseCulpable .S1515a3CKnowledge p c)
    (hIntent : ClauseCulpable .S1515a3CIntent p c) :
    MisleadingProngScienter .WritingOrRecording p c := ⟨hKnow, hIntent⟩

theorem misleadingProngScienter_sampleOrObject_intro {p : Person} {c : ComplaintText}
    (hKnow : ClauseCulpable .S1515a3DKnowledge p c)
    (hIntent : ClauseCulpable .S1515a3DIntent p c) :
    MisleadingProngScienter .SampleOrObject p c := ⟨hKnow, hIntent⟩

theorem misleadingProngScienter_trickSchemeDevice_intro {p : Person} {c : ComplaintText}
    (hKnow : ClauseCulpable .S1515a3EKnowledge p c)
    (hIntent : ClauseCulpable .S1515a3EIntent p c) :
    MisleadingProngScienter .TrickSchemeDevice p c := ⟨hKnow, hIntent⟩

theorem misleadingConductScienter_intro {p : Person} {c : ComplaintText}
    (mp : MisleadingProng) (h : MisleadingProngScienter mp p c) :
    MisleadingConductScienter p c := ⟨mp, h⟩




theorem corruptPersuasionScienter_intro {p : Person} {c : ComplaintText}
    (hCorrupt : Corruptly p c)
    (hNotExcluded : ¬ MisleadingConductButForLackOfStateOfMind p c) :
    CorruptPersuasionScienter p c := ⟨hCorrupt, hNotExcluded⟩


theorem corruptly1505_intro {p : Person} {c : ComplaintText}
    (h : ActsWithImproperPurpose p c) : Corruptly1505 p c := h



theorem scienter1512a1_intro {p : Person} {c : ComplaintText}
    (h : ClauseCulpable .S1512a1 p c) : Scienter1512a1 p c := h

theorem scienter1512a2_intro {p : Person} {c : ComplaintText}
    (h : ClauseCulpable .S1512a2 p c) : Scienter1512a2 p c := h

theorem scienter1512a2ViaObjectImpairment_intro {p induced : Person} {c : ComplaintText}
    (hDef : ClauseCulpable .S1512a2 p c) (hInduced : ClauseCulpable .S1512a2Bii induced c) :
    Scienter1512a2ViaObjectImpairment p induced c := ⟨hDef, hInduced⟩

theorem conductRouteScienter_intimidation_intro {p : Person} {c : ComplaintText}
    (h : ClauseCulpable .S1512bConduct p c) :
    ConductRouteScienter .Intimidation p c := h

theorem conductRouteScienter_threat_intro {p : Person} {c : ComplaintText}
    (h : ClauseCulpable .S1512bConduct p c) :
    ConductRouteScienter .Threat p c := h

theorem conductRouteScienter_corruptPersuasion_intro {p : Person} {c : ComplaintText}
    (hKnow : ClauseCulpable .S1512bConduct p c) (hCorrupt : CorruptPersuasionScienter p c) :
    ConductRouteScienter .CorruptPersuasion p c := ⟨hKnow, hCorrupt⟩

theorem conductRouteScienter_misleadingConduct_intro {p : Person} {c : ComplaintText}
    (hKnow : ClauseCulpable .S1512bConduct p c) (hMislead : MisleadingConductScienter p c) :
    ConductRouteScienter .MisleadingConduct p c := ⟨hKnow, hMislead⟩

theorem scienter1512b_intro {p : Person} {c : ComplaintText} {r : ConductRoute1512b}
    (hConduct : ConductRouteScienter r p c)
    (hObjective : ClauseCulpable .S1512bObjective p c) :
    Scienter1512b r p c := ⟨hConduct, hObjective⟩

theorem scienter1512bViaObjectImpairment_intro {p induced : Person} {c : ComplaintText}
    {r : ConductRoute1512b} (hBase : Scienter1512b r p c)
    (hInduced : ClauseCulpable .S1512b2B induced c) :
    Scienter1512bViaObjectImpairment r p induced c := ⟨hBase, hInduced⟩

theorem scienter1512c1_intro {p : Person} {c : ComplaintText}
    (hCorrupt : Corruptly p c) (hIntent : ClauseCulpable .S1512c1Intent p c) :
    Scienter1512c1 p c := ⟨hCorrupt, hIntent⟩

theorem scienter1512c2_intro {p : Person} {c : ComplaintText}
    (hCorrupt : Corruptly p c) (hState : ClauseCulpable .S1512c2 p c) :
    Scienter1512c2 p c := ⟨hCorrupt, hState⟩

theorem scienter1512d_intro {p : Person} {c : ComplaintText}
    (hHarass : ClauseCulpable .S1512dHarassment p c)
    (hResult : ClauseCulpable .S1512dResult p c) :
    Scienter1512d p c := ⟨hHarass, hResult⟩

theorem scienter1512k_intro {p : Person} {c : ComplaintText}
    (h : ClauseCulpable .S1512kConspiracy p c) : Scienter1512k p c := h

theorem defense1512e_intro {p : Person} {c : ComplaintText}
    (hLawful : ConductSolelyLawful p c)
    (hSole : SoleIntentionToEncourageTruthfulTestimony p c)
    (hPleaded : ClauseCulpable .S1512eDefense p c) :
    Defense1512e p c := ⟨hLawful, hSole, hPleaded⟩



theorem section1512Culpable_a1_intro {p : Person} {c : ComplaintText}
    (h : Scienter1512a1 p c) : Section1512Culpable p c := .a1 h

theorem section1512Culpable_a2_intro {p : Person} {c : ComplaintText}
    (h : Scienter1512a2 p c) : Section1512Culpable p c := .a2 h

theorem section1512Culpable_a2ObjectImpairment_intro {p induced : Person} {c : ComplaintText}
    (h : Scienter1512a2ViaObjectImpairment p induced c) : Section1512Culpable p c :=
  .a2ObjectImpairment induced h

theorem section1512Culpable_b_intro {p : Person} {c : ComplaintText} {r : ConductRoute1512b}
    (h : Scienter1512b r p c) : Section1512Culpable p c := .b r h

theorem section1512Culpable_bObjectImpairment_intro {p induced : Person} {c : ComplaintText}
    {r : ConductRoute1512b} (h : Scienter1512bViaObjectImpairment r p induced c) :
    Section1512Culpable p c := .bObjectImpairment r induced h

theorem section1512Culpable_c1_intro {p : Person} {c : ComplaintText}
    (h : Scienter1512c1 p c) : Section1512Culpable p c := .c1 h

theorem section1512Culpable_c2_intro {p : Person} {c : ComplaintText}
    (h : Scienter1512c2 p c) : Section1512Culpable p c := .c2 h

theorem section1512Culpable_d_intro {p : Person} {c : ComplaintText}
    (h : Scienter1512d p c) : Section1512Culpable p c := .d h

theorem section1512Culpable_k_intro {p : Person} {c : ComplaintText}
    (h : Scienter1512k p c) : Section1512Culpable p c := .k h




theorem section1512ScienterLiable_intro {p : Person} {c : ComplaintText}
    (hCulpable : Section1512Culpable p c)
    (hNoDefense : ¬ Defense1512e p c)
    (hNoRepresentationCarveOut : ¬ LawfulBonaFideLegalRepresentation p c) :
    Section1512ScienterLiable p c :=
  ⟨hCulpable, hNoDefense, hNoRepresentationCarveOut⟩

end Proving.USC.T18.Ch73.Reslice.Scienter

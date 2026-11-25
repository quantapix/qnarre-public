






import Proving.USC.T18.Ch11.Reslice.Scienter.Types
import Proving.USC.T18.Ch11.Reslice.Scienter.Predicates
import Proving.USC.T18.Ch11.Reslice.Scienter.Statute
import Proving.USC.Common.Types

set_option autoImplicit false
set_option relaxedAutoImplicit false

namespace Proving.USC.T18.Ch11.Reslice.Scienter

open Proving.USC.Common


theorem scienterMet_intro {req : MentalState} {p : Person} {c : ComplaintText}
    (rung : MentalState) (hReach : rung.atLeast req)
    (hProv : MentalStateProven p rung c) : ScienterMet req p c :=
  ⟨rung, hReach, hProv⟩

theorem culpable201b_intro {p : Person} {c : ComplaintText}
    (hCorrupt : ActedCorruptly p c) (rung : MentalState)
    (hReach : rung.atLeast RequiredMentalState201b)
    (hProv : MentalStateProven p rung c) : Culpable201b p c :=
  ⟨hCorrupt, rung, hReach, hProv⟩

theorem culpable201c_intro {p : Person} {c : ComplaintText}
    (rung : MentalState) (hReach : rung.atLeast RequiredMentalState201c)
    (hProv : MentalStateProven p rung c) : Culpable201c p c :=
  ⟨rung, hReach, hProv⟩

theorem culpable203_intro {p : Person} {c : ComplaintText}
    (rung : MentalState) (hReach : rung.atLeast RequiredMentalState203)
    (hProv : MentalStateProven p rung c) : Culpable203 p c :=
  ⟨rung, hReach, hProv⟩

theorem culpable207_intro {p : Person} {c : ComplaintText}
    (rung : MentalState) (hReach : rung.atLeast RequiredMentalState207)
    (hProv : MentalStateProven p rung c) : Culpable207 p c :=
  ⟨rung, hReach, hProv⟩

theorem culpable208_intro {p : Person} {c : ComplaintText}
    (rung : MentalState) (hReach : rung.atLeast RequiredMentalState208)
    (hProv : MentalStateProven p rung c) : Culpable208 p c :=
  ⟨rung, hReach, hProv⟩

theorem culpable210_intro {p : Person} {c : ComplaintText}
    (rung : MentalState) (hReach : rung.atLeast RequiredMentalState210)
    (hProv : MentalStateProven p rung c) : Culpable210 p c :=
  ⟨rung, hReach, hProv⟩

theorem culpable215_intro {p : Person} {c : ComplaintText}
    (hCorrupt : ActedCorruptly p c) (rung : MentalState)
    (hReach : rung.atLeast RequiredMentalState215)
    (hProv : MentalStateProven p rung c) : Culpable215 p c :=
  ⟨hCorrupt, rung, hReach, hProv⟩

theorem culpable220_intro {p : Person} {c : ComplaintText}
    (rung : MentalState) (hReach : rung.atLeast RequiredMentalState220)
    (hProv : MentalStateProven p rung c) : Culpable220 p c :=
  ⟨rung, hReach, hProv⟩

theorem culpable224_intro {p : Person} {c : ComplaintText}
    (rung : MentalState) (hReach : rung.atLeast RequiredMentalState224)
    (hProv : MentalStateProven p rung c) : Culpable224 p c :=
  ⟨rung, hReach, hProv⟩


theorem culpable226_intent_intro {p : Person} {c : ComplaintText}
    (hCorrupt : ActedCorruptly p c) (rung : MentalState)
    (hReach : rung.atLeast RequiredMentalState226)
    (hProv : MentalStateProven p rung c)
    (hTerror : IntentToCommitTerrorismViaBribery p c) : Culpable226 p c :=
  ⟨hCorrupt, ⟨rung, hReach, hProv⟩, Or.inl hTerror⟩


theorem culpable226_knowledge_intro {p : Person} {c : ComplaintText}
    (hCorrupt : ActedCorruptly p c) (rung : MentalState)
    (hReach : rung.atLeast RequiredMentalState226)
    (hProv : MentalStateProven p rung c)
    (hKnew : KnewInfluenceUsedForTerrorism p c) : Culpable226 p c :=
  ⟨hCorrupt, ⟨rung, hReach, hProv⟩, Or.inr hKnew⟩

theorem culpable227_intro {p : Person} {c : ComplaintText}
    (rung : MentalState) (hReach : rung.atLeast RequiredMentalState227)
    (hProv : MentalStateProven p rung c) : Culpable227 p c :=
  ⟨rung, hReach, hProv⟩



theorem criminallyCulpable216_intro {p : Person} {c : ComplaintText}
    (rung : MentalState) (hReach : rung.atLeast WillfulCriminalEnhancement216)
    (hProv : MentalStateProven p rung c) : CriminallyCulpable216 p c :=
  ⟨rung, hReach, hProv⟩




theorem culpable201b_implies_201c {p : Person} {c : ComplaintText}
    (h : Culpable201b p c) : Culpable201c p c := by
  obtain ⟨_, rung, hReach, hProv⟩ := h
  have hdom : (MentalState.Specific).atLeast MentalState.Knowledge := by
    unfold MentalState.atLeast; decide
  exact ⟨rung, MentalState.atLeast_trans hReach hdom, hProv⟩

end Proving.USC.T18.Ch11.Reslice.Scienter

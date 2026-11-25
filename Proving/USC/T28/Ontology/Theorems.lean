





import Proving.USC.T28.Ontology.Types
import Proving.USC.T28.Ontology.Predicates
import Proving.USC.T28.Ontology.Statute
import Proving.USC.Common.Types

namespace Proving.USC.T28.Ontology

open Proving.USC.Common (ComplaintText Person)


theorem dcTreatedAsState_intro {s : State} {c : ComplaintText}
    (hDC : IsDistrictOfColumbia s c) (hState : IsStateForSection1343 s c)
    : DCTreatedAsState s c := ⟨hDC, hState⟩


theorem dcExclusiveActAsDCStatute_intro {a : ActOfCongress} {c : ComplaintText}
    (hExcl : IsActExclusiveToDC a c) (hStat : IsStatuteOfDC a c)
    : DCExclusiveActAsDCStatute a c := ⟨hExcl, hStat⟩


theorem section1343Basis_conspiracyDamages_intro {act : CivilAction} {c : ComplaintText}
    (h : IsConspiracyDamagesAction act c) : Section1343Basis act c :=
  Section1343Basis.conspiracyDamages h


theorem section1343Basis_neglectToPrevent_intro {act : CivilAction} {c : ComplaintText}
    (h : IsNeglectToPreventAction act c) : Section1343Basis act c :=
  Section1343Basis.neglectToPrevent h


theorem section1343Basis_colorOfLawDeprivation_intro {act : CivilAction} {c : ComplaintText}
    (h : IsColorOfLawDeprivationAction act c) : Section1343Basis act c :=
  Section1343Basis.colorOfLawDeprivation h


theorem section1343Basis_civilRightsProtection_intro {act : CivilAction} {c : ComplaintText}
    (h : IsCivilRightsProtectionAction act c) : Section1343Basis act c :=
  Section1343Basis.civilRightsProtection h


theorem section1343Jurisdiction_intro {act : CivilAction} {p : Person} {c : ComplaintText}
    (hAuth : IsCivilActionAuthorizedByLaw act c)
    (hComm : CommencedByPerson act p c)
    (hBasis : Section1343Basis act c)
    : Section1343Jurisdiction act p c := ⟨hAuth, hComm, hBasis⟩


theorem perjuryForm_withoutUS_intro {d : Declaration} {c : ComplaintText}
    (hLoc : ExecutedWithoutUnitedStates d c) (hLaws : RecitesLawsOfUnitedStates d c)
    : PerjuryForm d c := PerjuryForm.withoutUS hLoc hLaws


theorem perjuryForm_withinUS_intro {d : Declaration} {c : ComplaintText}
    (hLoc : ExecutedWithinUnitedStates d c) : PerjuryForm d c :=
  PerjuryForm.withinUS hLoc



theorem unswornDeclarationDef_intro {d : Declaration} {c : ComplaintText}
    (hDecl : DeclaresUnderPenaltyOfPerjury d c)
    (hTrue : AssertsTrueAndCorrect d c)
    (hDate : StatesExecutionDate d c)
    (hSig : BearsSignature d c)
    (hForm : PerjuryForm d c)
    (hMem : IsUnswornDeclaration d c)
    : UnswornDeclarationDef d c := ⟨hDecl, hTrue, hDate, hSig, hForm, hMem⟩

end Proving.USC.T28.Ontology

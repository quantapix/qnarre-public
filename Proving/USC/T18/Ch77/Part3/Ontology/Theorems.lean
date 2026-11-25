






import Proving.USC.T18.Ch77.Part3.Ontology.Types
import Proving.USC.T18.Ch77.Part3.Ontology.Predicates
import Proving.USC.T18.Ch77.Part3.Ontology.Statute
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch77.Part3.Ontology

open Proving.USC.Common




theorem directVictim_intro {p : Person} {o : Offense} {c : ComplaintText}
    (hOffense : IsOffenseUnderThisChapter o c)
    (hHarm : HarmResultedFromOffense p o c) :
    DirectVictim p o c :=
  ⟨hOffense, hHarm⟩


theorem representationTrigger_minor_intro {p : Person} {c : ComplaintText}
    (h : IsUnderEighteen p c) : RepresentationTrigger p c :=
  RepresentationTrigger.minor h


theorem representationTrigger_incompetent_intro {p : Person} {c : ComplaintText}
    (h : IsIncompetent p c) : RepresentationTrigger p c :=
  RepresentationTrigger.incompetent h


theorem representationTrigger_incapacitated_intro {p : Person} {c : ComplaintText}
    (h : IsIncapacitated p c) : RepresentationTrigger p c :=
  RepresentationTrigger.incapacitated h


theorem representationTrigger_deceased_intro {p : Person} {c : ComplaintText}
    (h : IsDeceased p c) : RepresentationTrigger p c :=
  RepresentationTrigger.deceased h


theorem representativeCategory_legalGuardian_intro {r p : Person} {c : ComplaintText}
    (h : IsLegalGuardianOf r p c) : RepresentativeCategory r p c :=
  RepresentativeCategory.legalGuardian h


theorem representativeCategory_estateRepresentative_intro {r p : Person} {c : ComplaintText}
    (h : IsRepresentativeOfEstateOf r p c) : RepresentativeCategory r p c :=
  RepresentativeCategory.estateRepresentative h


theorem representativeCategory_familyMember_intro {r p : Person} {c : ComplaintText}
    (h : IsFamilyMemberOf r p c) : RepresentativeCategory r p c :=
  RepresentativeCategory.familyMember h



theorem representativeCategory_courtAppointed_intro {r p : Person} {c : ComplaintText}
    (h : IsCourtAppointedSuitablePerson r p c) : RepresentativeCategory r p c :=
  RepresentativeCategory.courtAppointed h


theorem representativeVictim_intro {r p : Person} {o : Offense} {c : ComplaintText}
    (hPrincipal : DirectVictim p o c)
    (hTrigger : RepresentationTrigger p c)
    (hCategory : RepresentativeCategory r p c)
    (hNotDefendant : ¬ IsDefendant r c) :
    RepresentativeVictim r p o c :=
  ⟨hPrincipal, hTrigger, hCategory, hNotDefendant⟩


theorem section1593cVictim_intro {p : Person} {o : Offense} {c : ComplaintText}
    (h : DirectVictim p o c) : Section1593cVictim c p :=
  Section1593cVictim.direct h


theorem section1593cVictim_representative_intro
    {r p : Person} {o : Offense} {c : ComplaintText}
    (h : RepresentativeVictim r p o c) : Section1593cVictim c r :=
  Section1593cVictim.representative h





theorem fullAmountOfVictimsLosses_intro {p : Person} {n : Nat} {c : ComplaintText}
    (hVictim : Section1593cVictim c p)
    (hAmount : n = fullAmountOfVictimsLosses p c) :
    FullAmountOfVictimsLosses p n c :=
  ⟨hVictim, hAmount⟩


theorem fullAmountOfVictimsLosses_self {p : Person} {c : ComplaintText}
    (hVictim : Section1593cVictim c p) :
    FullAmountOfVictimsLosses p (fullAmountOfVictimsLosses p c) c :=
  ⟨hVictim, rfl⟩




theorem section1593bOrder_intro
    {ord : RestitutionOrder} {p : Person} {n : Nat} {c : ComplaintText}
    (hOrder : IsOrderOfRestitutionUnderSection1593 ord c)
    (hDirects : DirectsPaymentToVictim ord p c)
    (hAmount : FullAmountOfVictimsLosses p n c)
    (hEnforce : IssuedAndEnforcedUnderSection3664 ord c) :
    Section1593bOrder ord p n c :=
  ⟨hOrder, hDirects, hAmount, hEnforce⟩




theorem section1593b4Forfeiture_intro {pr : Property} {c : ComplaintText}
    (hSubject : IsPropertySubjectToForfeiture pr c)
    (hGoverned : GovernedBySection853 pr c) :
    Section1593b4Forfeiture pr c :=
  ⟨hSubject, hGoverned⟩

end Proving.USC.T18.Ch77.Part3.Ontology

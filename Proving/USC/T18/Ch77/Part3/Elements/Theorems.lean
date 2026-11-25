




import Proving.USC.T18.Ch77.Part3.Elements.Types
import Proving.USC.T18.Ch77.Part3.Elements.Predicates
import Proving.USC.T18.Ch77.Part3.Elements.Statute
import Proving.USC.Common.Types
import Proving.USC.Common.Predicates

set_option autoImplicit false

namespace Proving.USC.T18.Ch77.Part3.Elements

open Proving.USC.Common


theorem section1593a_intro {d : Person} {o : Offense} {c : ComplaintText}
    (hOffense : IsChapter77Offense o c)
    (hConvicted : DefendantConvictedOfOffense d o c) :
    Section1593a d o c :=
  ⟨hOffense, hConvicted⟩


theorem directVictim_intro {v : Person} {o : Offense} {c : ComplaintText}
    (hHarmed : IsIndividualHarmed v o c) (hCause : ProximateCause v c) :
    DirectVictim v o c :=
  ⟨hHarmed, hCause⟩


theorem representationTrigger_underEighteen_intro {v : Person} {c : ComplaintText}
    (h : VictimUnderEighteen v c) : RepresentationTrigger v c :=
  .underEighteen h


theorem representationTrigger_incompetent_intro {v : Person} {c : ComplaintText}
    (h : VictimIncompetent v c) : RepresentationTrigger v c :=
  .incompetent h


theorem representationTrigger_incapacitated_intro {v : Person} {c : ComplaintText}
    (h : VictimIncapacitated v c) : RepresentationTrigger v c :=
  .incapacitated h


theorem representationTrigger_deceased_intro {v : Person} {c : ComplaintText}
    (h : VictimDeceased v c) : RepresentationTrigger v c :=
  .deceased h


theorem representativeCapacity_legalGuardian_intro
    {r : Person} {v : Person} {c : ComplaintText}
    (h : IsLegalGuardianOfVictim r v c) : RepresentativeCapacity r v c :=
  .legalGuardian h


theorem representativeCapacity_estateRepresentative_intro
    {r : Person} {v : Person} {c : ComplaintText}
    (h : IsRepresentativeOfVictimEstate r v c) : RepresentativeCapacity r v c :=
  .estateRepresentative h


theorem representativeCapacity_familyMember_intro
    {r : Person} {v : Person} {c : ComplaintText}
    (h : IsFamilyMemberOfVictim r v c) : RepresentativeCapacity r v c :=
  .familyMember h



theorem representativeCapacity_courtAppointed_intro
    {r : Person} {v : Person} {c : ComplaintText}
    (h : IsCourtAppointedSuitablePerson r v c) : RepresentativeCapacity r v c :=
  .courtAppointed h



theorem victimRepresentative_intro
    {r : Person} {harmed : Person} {o : Offense} {c : ComplaintText}
    (hTrigger : RepresentationTrigger harmed c)
    (hCapacity : RepresentativeCapacity r harmed c)
    (hNotDefendant : ¬ IsDefendantInOffense r o c) :
    VictimRepresentative r harmed o c :=
  ⟨hTrigger, hCapacity, hNotDefendant⟩


theorem victim1593c_direct_intro
    {payee : Person} {harmed : Person} {o : Offense} {c : ComplaintText}
    (h : payee = harmed) : Victim1593c payee harmed o c :=
  .direct h


theorem victim1593c_representative_intro
    {payee : Person} {harmed : Person} {o : Offense} {c : ComplaintText}
    (h : VictimRepresentative payee harmed o c) : Victim1593c payee harmed o c :=
  .representative h


theorem section1593b_intro
    {ord : RestitutionOrder} {payee : Person} {harmed : Person} {d : Person}
    {c : ComplaintText}
    (hDirects : OrderDirectsDefendantToPayVictim ord d payee c)
    (hMechanism : PaymentThroughCourtMechanism ord c)
    (hFullAmount : OrderAwardsFullAmountOfVictimsLosses ord harmed d c)
    (h3664 : OrderIssuedAndEnforcedUnderSection3664 ord c) :
    Section1593b ord payee harmed d c :=
  ⟨hDirects, hMechanism, hFullAmount, h3664⟩


theorem section1593b4_intro {pr : Property} {c : ComplaintText}
    (h : ForfeitureGovernedBySection853 pr c) : Section1593b4 pr c :=
  ⟨h⟩


theorem section1593_intro
    {d : Person} {o : Offense} {payee : Person} {harmed : Person}
    {ord : RestitutionOrder} {c : ComplaintText}
    (hTrigger : Section1593a d o c)
    (hVictim : DirectVictim harmed o c)
    (hPayee : Victim1593c payee harmed o c)
    (hOrder : Section1593b ord payee harmed d c) :
    Section1593 d o payee harmed ord c :=
  ⟨hTrigger, hVictim, hPayee, hOrder⟩

end Proving.USC.T18.Ch77.Part3.Elements

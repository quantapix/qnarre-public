






import Proving.USC.T42.PublicAccommodations.Prohibition.Elements.Statute

namespace Proving.USC.T42.PublicAccommodations.Prohibition.Elements

open Proving.USC.Common


theorem section2000a1_intro {p est c}
    (hPerson : IsPersonInUS p c)
    (hDisc : SufferedDiscriminationOrSegregation p est c)
    (hGround : OnProtectedGround p c)
    (hPlace : AtEstablishmentOrPlace est c)
    (hState : RequiredByStateLaw c) :
    Section2000a1 p est c :=
  ⟨hPerson, hDisc, hGround, hPlace, hState⟩


theorem section2000a2Deprive_intro {p r c}
    (hPerson : IsPersonInUS p c)
    (hSecured : RightSecuredBy2000a r c)
    (hConduct : WithheldOrDeprivedRight p r c) :
    Section2000a2_Deprive p r c :=
  ⟨hPerson, hSecured, hConduct⟩


theorem section2000a2Coerce_intro {p r c}
    (hPerson : IsPersonInUS p c)
    (hSecured : RightSecuredBy2000a r c)
    (hConduct : IntimidatedThreatenedCoerced p c)
    (hPurpose : PurposeOfInterfering p r c) :
    Section2000a2_Coerce p r c :=
  ⟨hPerson, hSecured, hConduct, hPurpose⟩


theorem section2000a2Punish_intro {p r c}
    (hPerson : IsPersonInUS p c)
    (hSecured : RightSecuredBy2000a r c)
    (hConduct : PunishedForExercising p r c) :
    Section2000a2_Punish p r c :=
  ⟨hPerson, hSecured, hConduct⟩


theorem prohibitedInterference_intro {p r c}
    (h : Section2000a2_Deprive p r c) :
    ProhibitedInterference p r c :=
  .deprive h

end Proving.USC.T42.PublicAccommodations.Prohibition.Elements

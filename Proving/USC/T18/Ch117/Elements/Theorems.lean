








import Proving.USC.T18.Ch117.Elements.Statute

namespace Proving.USC.T18.Ch117.Elements

open Proving.USC.Common (Person ComplaintText ActedWithScienter ProximateCause)



theorem illicitSexualConduct_of_sexualAct {p c}
    (h : SexualActWithMinorUnder18 p c) : EngagesInIllicitSexualConduct p c :=
  .sexualAct h

theorem illicitSexualConduct_of_commercialSexAct {p c}
    (h : CommercialSexActWithMinorUnder18 p c) : EngagesInIllicitSexualConduct p c :=
  .commercialSexAct h

theorem illicitSexualConduct_of_childPorn {p c}
    (h : ProducesChildPornography p c) : EngagesInIllicitSexualConduct p c :=
  .childPorn h



theorem section2421a_intro {p v c}
    (hScienter : ActedWithScienter p c)
    (hTransports : TransportsIndividualInInterstateCommerce p v c)
    (hIntent : IntentToEngageInProscribedSexualActivity p c) :
    Section2421a p v c :=
  ⟨hScienter, hTransports, hIntent⟩



theorem section2421A_a_intro {p c}
    (hUses : UsesInterstateCommerceFacility p c)
    (hICS : OwnsManagesOperatesInteractiveComputerService p c)
    (hIntent : IntentToPromoteOrFacilitateProstitution p c) :
    Section2421A_a p c :=
  ⟨hUses, hICS, hIntent⟩

theorem section2421A_b_intro {p c}
    (hBase : Section2421A_a p c) (hAgg : Aggravator2421A_b p c) :
    Section2421A_b p c :=
  ⟨hBase, hAgg⟩

theorem section2421A_c_intro {plaintiff defendant c}
    (hViolation : Section2421A_b defendant c)
    (hInjury : IsInjuredPerson plaintiff c)
    (hCausation : ProximateCause plaintiff c) :
    Section2421A_c plaintiff defendant c :=
  ⟨hViolation, hInjury, hCausation⟩



theorem section2422a_intro {p v c}
    (hScienter : ActedWithScienter p c)
    (hEntices : PersuadesInducesEnticesOrCoerces p v c)
    (hTravel : CausesIndividualToTravelInInterstateCommerce p v c)
    (hIntent : IntentToEngageInProscribedSexualActivity p c) :
    Section2422a p v c :=
  ⟨hScienter, hEntices, hTravel, hIntent⟩

theorem section2422b_intro {p v c}
    (hScienter : ActedWithScienter p c)
    (hUses : UsesInterstateCommerceFacility p c)
    (hEntices : PersuadesInducesEnticesOrCoerces p v c)
    (hMinor : IndividualUnderAge18 v c)
    (hIntent : IntentToEngageInProscribedSexualActivity p c) :
    Section2422b p v c :=
  ⟨hScienter, hUses, hEntices, hMinor, hIntent⟩



theorem section2423a_intro {p v c}
    (hScienter : ActedWithScienter p c)
    (hTransports : TransportsIndividualInInterstateCommerce p v c)
    (hMinor : IndividualUnderAge18 v c)
    (hIntent : IntentToEngageInProscribedSexualActivity p c) :
    Section2423a p v c :=
  ⟨hScienter, hTransports, hMinor, hIntent⟩

theorem section2423b_intro {p c}
    (hTravels : TravelsInInterstateOrForeignCommerce p c)
    (hIntent : IntentToEngageInIllicitSexualConduct p c) :
    Section2423b p c :=
  ⟨hTravels, hIntent⟩

theorem section2423c_intro {p c}
    (hCitizen : IsUSCitizenOrPermanentResident p c)
    (hTravels : TravelsInForeignCommerceOrResidesAbroad p c)
    (hEngages : EngagesInIllicitSexualConduct p c) :
    Section2423c p c :=
  ⟨hCitizen, hTravels, hEngages⟩

theorem section2423e_intro {p v c}
    (hPurpose : ForCommercialAdvantageOrPrivateGain p c)
    (hArranges : ArrangesOrFacilitatesTravel p v c)
    (hKnows : KnowsTravelerIntendsIllicitSexualConduct p c) :
    Section2423e p v c :=
  ⟨hPurpose, hArranges, hKnows⟩



theorem section2424a_intro {p v c}
    (hKeeps : KeepsOrHarborsForProstitution p v c)
    (hAlien : KnowsOrRecklesslyDisregardsAlienStatus p v c)
    (hViolation : Violation2424 p c) :
    Section2424a p v c :=
  ⟨hKeeps, hAlien, hViolation⟩



theorem section2425_intro {p v c}
    (hScienter : ActedWithScienter p c)
    (hUses : UsesInterstateCommerceFacility p c)
    (hInitiates : InitiatesTransmissionOfMinorIdentifyingInfo p v c)
    (hMinor : IndividualUnderAge16 v c)
    (hIntent : IntentToEnticeSolicitProscribedSexualActivity p c) :
    Section2425 p v c :=
  ⟨hScienter, hUses, hInitiates, hMinor, hIntent⟩

end Proving.USC.T18.Ch117.Elements

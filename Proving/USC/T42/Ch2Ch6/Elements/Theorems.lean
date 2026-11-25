



import Proving.USC.T42.Ch2Ch6.Elements.Statute

namespace Proving.USC.T42.Ch2Ch6.Elements
open Proving.USC.Common

theorem section88_intro {v cg c}
    (h1 : StateHealthLawProhibitsPortEntry v c) (h2 : StateHealthLawPermitsAlternateUnlading v c)
    (h3 : WholeCargoReportedToCollector cg c) (h4 : UnladingUnderCustomsSupervision cg c)
    (h5 : SecretaryConditionsObserved cg c) : Section88 v cg c :=
  ⟨h1, h2, h3, h4, h5⟩

theorem section89_intro {v w c}
    (h1 : VesselSubjectToQuarantine v c) (h2 : WarehousesErectedUnderPresidentialOrder w c)
    (h3 : LocationServesRevenueAndHealthLaws w c) : Section89 v w c :=
  ⟨h1, h2, h3⟩

theorem section90_intro {cg w c}
    (h1 : CargoUnladenUnderSections88And89 cg c) (h2 : ArticlesDepositedInDesignatedWarehouse cg w c)
    (h3 : HeldInJointCustody cg c) (h4 : RemovableWithoutContraveningHealthLaws cg c)
    (h5 : EnteredAndDutiesPaidWithStorage cg c) : Section90 cg w c :=
  ⟨h1, h2, h3, h4, h5⟩

theorem section91_intro {v cg c}
    (h1 : ConformityToQuarantineRequiresExtension v c) (h2 : VesselSubjectToQuarantineHealthLaws v c)
    (h3 : NoUnladingExceptAsAllowed cg c) : Section91 v cg c :=
  ⟨h1, h2, h3⟩

theorem section97_intro {v o c}
    (h1 : StateHealthLawEstablishesQuarantine v c) (h2 : IsFederalMaritimeOfficer o c)
    (h3 : WithinOfficerPowersAndPrecinct o c) (h4 : ObservesAndAidsHealthLaws o c)
    : Section97 v o c :=
  ⟨h1, h2, h3, h4⟩

theorem section97Proviso_intro {c}
    (h1 : NoStateTonnageDutyWithoutCongressConsent c) : Section97Proviso c :=
  ⟨h1⟩

theorem section98_intro {v c}
    (h1 : RequestBySecretaryHHS c) (h2 : VesselBelongsToUSNotRequiredElsewhere v c)
    (h3 : PlacedGratuitouslyForTemporaryQuarantine v c) : Section98 v c :=
  ⟨h1, h2, h3⟩

theorem section112_intro {o c}
    (h1 : ContagiousOrEpidemicDiseasePrevalent c) (h2 : DangerousOrInconvenientToContinueDuties o c)
    (h3 : RemovalToConvenientPlaceNearDistrict o c) (h4 : PublicNoticeGiven c) : Section112 o c :=
  ⟨h1, h2, h3, h4⟩

theorem section191_intro {b c}
    (h1 : ChildrensBureauEstablishedInHHS b c) : Section191 b c :=
  ⟨h1⟩

theorem section192_intro {p b o c}
    (h1 : ChiefAppointedByPresidentWithSenateConsent p c) (h2 : BureauInvestigatesAndReportsChildWelfare b c)
    (h3 : NoEntryOverFamilyObjection o c) : Section192 p b o c :=
  ⟨h1, h2, h3⟩

theorem section193_intro {p c}
    (h1 : AssistantChiefAppointedBySecretary p c) : Section193 p c :=
  ⟨h1⟩

theorem section194_intro {b n c}
    (hq : QuartersFurnishedForBureau b c) (hr : AnnualRentalIs n c) (hc : n ≤ 2000)
    : Section194 b n c :=
  ⟨hq, hr, hc⟩



example {b c} (hq : QuartersFurnishedForBureau b c) (hr : AnnualRentalIs 1500 c)
    : Section194 b 1500 c :=
  section194_intro hq hr (by omega)

end Proving.USC.T42.Ch2Ch6.Elements

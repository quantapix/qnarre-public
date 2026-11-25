





import Proving.USC.T18.Ch113B.Wmd.Part2.Deontic.Types
import Proving.USC.T18.Ch113B.Wmd.Part2.Deontic.Predicates
import Proving.USC.T18.Ch113B.Wmd.Part2.Deontic.Statute
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch113B.Wmd.Part2.Deontic

open Proving.USC.Common




theorem transcendsNationalBoundaries_intro {k : Conduct} {c : ComplaintText}
    (hIn : ConductOccurredInUnitedStates k c)
    (hOut : ConductOccurredOutsideUnitedStates k c) :
    TranscendsNationalBoundaries k c :=
  ⟨hIn, hOut⟩





theorem actClauseA_intro {p v : Person} {k : Conduct} {c : ComplaintText}
    (hAct : ProscribedActAgainstPerson p v k c)
    (hLocus : VictimIsPersonWithinUnitedStates v c) :
    ActClauseA p v k c :=
  ⟨hAct, hLocus⟩



theorem actClauseB_intro {p : Person} {pr : Property} {k : Conduct} {c : ComplaintText}
    (hRisk : CreatedSubstantialRiskOfSeriousBodilyInjuryToAnotherPerson p k c)
    (hMeans : PropertyMeansClauseB p pr k c)
    (hLocus : PropertyIsWithinUnitedStates pr c) :
    ActClauseB p pr k c :=
  ⟨hRisk, hMeans, hLocus⟩




theorem prohibition2332bA1_intro {p : Person} {pr : Property} {k : Conduct} {c : ComplaintText}
    (hAddr : AddresseeAnyPerson p c)
    (hTrans : TranscendsNationalBoundaries k c)
    (hCirc : SubsectionBCircumstance pr k c)
    (hUnlawful : PredicateLawViolated p k c) :
    Prohibition2332bA1 p pr k c :=
  ⟨hAddr, hTrans, hCirc, hUnlawful⟩



theorem prohibition2332bA1Violated_intro {p v : Person} {pr : Property} {k : Conduct}
    {c : ComplaintText}
    (hNorm : Prohibition2332bA1 p pr k c)
    (hAct : ProscribedConduct2332bA1 p v pr k c) :
    Prohibition2332bA1Violated p v pr k c :=
  ⟨hNorm, hAct⟩





theorem objectOffenseUnderParagraph1_intro {q v : Person} {pr : Property} {o : Offense}
    {k : Conduct} {c : ComplaintText}
    (hConstituted : OffenseWouldBeConstitutedByConduct o k c)
    (hTrans : TranscendsNationalBoundaries k c)
    (hCirc : SubsectionBCircumstance pr k c)
    (hAct : ProscribedConduct2332bA1 q v pr k c)
    (hUnlawful : PredicateLawViolated q k c) :
    ObjectOffenseUnderParagraph1 q v pr o k c :=
  ⟨hConstituted, hTrans, hCirc, hAct, hUnlawful⟩


theorem prohibition2332bA2_intro {p q v : Person} {pr : Property} {o : Offense}
    {k : Conduct} {c : ComplaintText}
    (hAddr : AddresseeAnyPerson p c)
    (hObject : ObjectOffenseUnderParagraph1 q v pr o k c) :
    Prohibition2332bA2 p q v pr o k c :=
  ⟨hAddr, hObject⟩



theorem prohibition2332bA2Violated_intro {p q v : Person} {pr : Property} {o : Offense}
    {k : Conduct} {c : ComplaintText}
    (hNorm : Prohibition2332bA2 p q v pr o k c)
    (hInchoate : InchoateMode2332bA2 p o c) :
    Prohibition2332bA2Violated p q v pr o k c :=
  ⟨hNorm, hInchoate⟩




theorem violatesThisSection_ofA1_intro {p v : Person} {pr : Property} {k : Conduct}
    {c : ComplaintText}
    (h : Prohibition2332bA1Violated p v pr k c) : ViolatesThisSection p c :=
  Or.inl ⟨v, pr, k, h⟩


theorem violatesThisSection_ofA2_intro {p q v : Person} {pr : Property} {o : Offense}
    {k : Conduct} {c : ComplaintText}
    (h : Prohibition2332bA2Violated p q v pr o k c) : ViolatesThisSection p c :=
  Or.inr ⟨q, v, pr, o, k, h⟩





theorem circumstanceApplicableToAtLeastOneOffender_intro {q : Person} {pr : Property}
    {o : Offense} {k : Conduct} {c : ComplaintText}
    (hOffender : IsOffenderInOffense q o c)
    (hConstituted : OffenseWouldBeConstitutedByConduct o k c)
    (hCirc : SubsectionBCircumstance pr k c) :
    CircumstanceApplicableToAtLeastOneOffender o c :=
  ⟨q, pr, k, hOffender, hConstituted, hCirc⟩


theorem power2332bB2_intro {p : Person} {o : Offense} {c : ComplaintText}
    (hClass : JurisdictionalPersonClass2332bB2 p o c)
    (hCirc : CircumstanceApplicableToAtLeastOneOffender o c) :
    Power2332bB2 p o c :=
  ⟨hClass, hCirc⟩


theorem power2332bB2Exercised_intro {p : Person} {o : Offense} {c : ComplaintText}
    (hPower : Power2332bB2 p o c)
    (hExercised : JurisdictionExercisedOverOffender p o c) :
    Power2332bB2Exercised p o c :=
  ⟨hPower, hExercised⟩




theorem obligation2332bC1_intro {t : Tribunal} {p : Person} {c : ComplaintText}
    (hAddr : AddresseeIsSentencingCourt t c)
    (hConvicted : PersonConvictedOfViolationOfThisSection p c) :
    Obligation2332bC1 t p c :=
  ⟨hAddr, hConvicted⟩



theorem obligation2332bC1Discharged_intro {t : Tribunal} {p : Person} {o : Offense}
    {s : Sentence} {c : ComplaintText}
    (hNorm : Obligation2332bC1 t p c)
    (hImposed : SentenceImposedOnPerson t p s c)
    (hRange : PunishmentPrescribed2332bC1 p o s c) :
    Obligation2332bC1Discharged t p o s c :=
  ⟨hNorm, hImposed, hRange⟩



theorem obligation2332bC1Breached_intro {t : Tribunal} {p : Person} {c : ComplaintText}
    (hNorm : Obligation2332bC1 t p c)
    (hNone : ¬ ∃ (o : Offense) (s : Sentence),
        SentenceImposedOnPerson t p s c ∧ PunishmentPrescribed2332bC1 p o s c) :
    Obligation2332bC1Breached t p c :=
  ⟨hNorm, hNone⟩




theorem prohibition2332bC2Probation_intro {t : Tribunal} {p : Person} {c : ComplaintText}
    (hAddr : AddresseeIsSentencingCourt t c)
    (hConvicted : PersonConvictedOfViolationOfThisSection p c) :
    Prohibition2332bC2Probation t p c :=
  ⟨hAddr, hConvicted⟩


theorem prohibition2332bC2ProbationViolated_intro {t : Tribunal} {p : Person}
    {c : ComplaintText}
    (hNorm : Prohibition2332bC2Probation t p c)
    (hAct : PlacedPersonOnProbation t p c) :
    Prohibition2332bC2ProbationViolated t p c :=
  ⟨hNorm, hAct⟩


theorem prohibition2332bC2ConcurrentTerm_intro {t : Tribunal} {p : Person} {s : Sentence}
    {c : ComplaintText}
    (hAddr : AddresseeIsSentencingCourt t c)
    (hImposed : TermOfImprisonmentImposedUnderThisSection s p c) :
    Prohibition2332bC2ConcurrentTerm t p s c :=
  ⟨hAddr, hImposed⟩


theorem prohibition2332bC2ConcurrentTermViolated_intro {t : Tribunal} {p : Person}
    {s : Sentence} {c : ComplaintText}
    (hNorm : Prohibition2332bC2ConcurrentTerm t p s c)
    (hAct : TermRunsConcurrentlyWithAnotherTermOfImprisonment s c) :
    Prohibition2332bC2ConcurrentTermViolated t p s c :=
  ⟨hNorm, hAct⟩




theorem permission2332bD1_intro {pros : Prosecution} {c : ComplaintText}
    (hScope : IsProsecutionUnderThisSection pros c)
    (hBase : JurisdictionalBaseAllegedInIndictment pros c) :
    Permission2332bD1 pros c :=
  ⟨hScope, hBase⟩


theorem permission2332bD1Exercised_intro {pros : Prosecution} {p : Person}
    {c : ComplaintText}
    (hPerm : Permission2332bD1 pros c)
    (hAct : ProceededWithoutProvingDefendantKnowledgeOfJurisdictionalBase pros p c) :
    Permission2332bD1Exercised pros p c :=
  ⟨hPerm, hAct⟩


theorem prohibition2332bD2_intro {pros : Prosecution} {c : ComplaintText}
    (hScope : IsProsecutionUnderThisSection pros c)
    (hStateLaw : ProsecutionBasedOnAdoptionOfStateLaw pros c) :
    Prohibition2332bD2 pros c :=
  ⟨hScope, hStateLaw⟩


theorem prohibition2332bD2Violated_intro {pros : Prosecution} {c : ComplaintText}
    (hNorm : Prohibition2332bD2 pros c)
    (hAct : AdoptedStateProvisionPertainingToCriminalProcedureOrEvidence pros c) :
    Prohibition2332bD2Violated pros c :=
  ⟨hNorm, hAct⟩



theorem prohibition2332bD2Complied_intro {pros : Prosecution} {c : ComplaintText}
    (hNorm : Prohibition2332bD2 pros c)
    (hOnlyElements : AdoptedOnlyElementsOfOffenseUnderStateLaw pros c)
    (hNoProcedure : ¬ AdoptedStateProvisionPertainingToCriminalProcedureOrEvidence pros c) :
    Prohibition2332bD2Complied pros c :=
  ⟨hNorm, hOnlyElements, hNoProcedure⟩




theorem offenseUnderSubsectionA_intro {q : Person} {o : Offense} {c : ComplaintText}
    (hOffender : IsOffenderInOffense q o c)
    (hViolates : ViolatesThisSection q c) :
    OffenseUnderSubsectionA o c :=
  ⟨q, hOffender, hViolates⟩



theorem power2332bEExercised_intro {p : Person} {o : Offense} {c : ComplaintText}
    (hBasis : ExtraterritorialJurisdictionBasis2332bE p o c)
    (hExercised : ExtraterritorialFederalJurisdictionExercised p o c) :
    Power2332bEExercised p o c :=
  ⟨hBasis, hExercised⟩





theorem federalCrimeOfTerrorism_intro {o : Offense} {c : ComplaintText}
    (hMotive : TerrorismMotive2332bG5A o c)
    (hEnumerated : EnumeratedPredicateViolation2332bG5B o c) :
    FederalCrimeOfTerrorism o c :=
  ⟨hMotive, hEnumerated⟩


theorem obligation2332bFAttorneyGeneral_intro {p : Person} {o : Offense} {c : ComplaintText}
    (hAddr : AddresseeIsAttorneyGeneral p c)
    (hMatter : InvestigativeResponsibilityMatter2332bF o c) :
    Obligation2332bFAttorneyGeneral p o c :=
  ⟨hAddr, hMatter⟩


theorem obligation2332bFAttorneyGeneralDischarged_intro {p : Person} {o : Offense}
    {c : ComplaintText}
    (hNorm : Obligation2332bFAttorneyGeneral p o c)
    (hAct : ExercisedPrimaryInvestigativeResponsibility p o c) :
    Obligation2332bFAttorneyGeneralDischarged p o c :=
  ⟨hNorm, hAct⟩


theorem obligation2332bFAttorneyGeneralBreached_intro {p : Person} {o : Offense}
    {c : ComplaintText}
    (hNorm : Obligation2332bFAttorneyGeneral p o c)
    (hOmitted : ¬ ExercisedPrimaryInvestigativeResponsibility p o c) :
    Obligation2332bFAttorneyGeneralBreached p o c :=
  ⟨hNorm, hOmitted⟩


theorem obligation2332bFTreasury_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeIsSecretaryOfTheTreasury p c)
    (hRequest : AttorneyGeneralRequestedAssistance c) :
    Obligation2332bFTreasury p c :=
  ⟨hAddr, hRequest⟩


theorem obligation2332bFTreasuryDischarged_intro {p : Person} {c : ComplaintText}
    (hNorm : Obligation2332bFTreasury p c)
    (hAct : AssistedAttorneyGeneral p c) :
    Obligation2332bFTreasuryDischarged p c :=
  ⟨hNorm, hAct⟩


theorem obligation2332bFTreasuryBreached_intro {p : Person} {c : ComplaintText}
    (hNorm : Obligation2332bFTreasury p c)
    (hOmitted : ¬ AssistedAttorneyGeneral p c) :
    Obligation2332bFTreasuryBreached p c :=
  ⟨hNorm, hOmitted⟩



theorem prohibition2332bFSecretServiceSavings_intro {x : Construction} {c : ComplaintText}
    (hAddr : IsConstructionOfThisSection x c) :
    Prohibition2332bFSecretServiceSavings x c :=
  ⟨hAddr⟩


theorem prohibition2332bFSecretServiceSavingsViolated_intro {x : Construction}
    {c : ComplaintText}
    (hNorm : Prohibition2332bFSecretServiceSavings x c)
    (hAct : ConstruedToInterfereWithSecretServiceAuthority x c) :
    Prohibition2332bFSecretServiceSavingsViolated x c :=
  ⟨hNorm, hAct⟩

end Proving.USC.T18.Ch113B.Wmd.Part2.Deontic

import Proving.USC.T18.Ch1Ch47.Recert2.Deontic.Types
import Proving.USC.T18.Ch1Ch47.Recert2.Deontic.Predicates
import Proving.USC.T18.Ch1Ch47.Recert2.Deontic.Statute
import Proving.USC.Common.Types

set_option autoImplicit false










namespace Proving.USC.T18.Ch1Ch47.Recert2.Deontic

open Proving.USC.Common



theorem definition7_intro {l : Locus} {c : ComplaintText}
    (hLocus : LocusWithinSMTJ l c) : Definition7 l c :=
  ⟨hLocus⟩

theorem locus7Para9_intro {l : Locus} {p : Person} {c : ComplaintText}
    (hBranch : Section7Paragraph9Locus l c)
    (hNotCarvedOut : ¬ OffenderDescribedInSection3261a p c) : Locus7Para9 l p c :=
  ⟨hBranch, hNotCarvedOut⟩

theorem prohibition7Para9Construction_intro
    {ct : Court} {t : Treaty} {c : ComplaintText}
    (hAddr : AddresseeInterpretingCourt ct c)
    (hCond : Paragraph9ConflictsWithTreaty t c) :
    Prohibition7Para9Construction ct t c :=
  ⟨hAddr, hCond⟩

theorem prohibition7Para9ConstructionViolated_intro
    {ct : Court} {t : Treaty} {c : ComplaintText}
    (hAddr : AddresseeInterpretingCourt ct c)
    (hCond : Paragraph9ConflictsWithTreaty t c)
    (hAct : DeemedToSupersedeConflictingTreaty ct t c) :
    Prohibition7Para9ConstructionViolated ct t c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩



theorem definition20_intro {i : Institution} {c : ComplaintText}
    (hMember : IsFinancialInstitution i c) : Definition20 i c :=
  ⟨hMember⟩



theorem permission21a_intro
    {g : Person} {d : Person} {pr : Property} {c : ComplaintText}
    (hAddr : AddresseeProponentOfProof g c)
    (hElem : StolenOrCounterfeitNatureIsElement pr c)
    (hRep : OfficialRepresentationMade d pr c)
    (hBelief : DefendantBelievedPropertyOfSuchCharacter d pr c) :
    Permission21a g d pr c :=
  ⟨hAddr, hElem, hRep, hBelief⟩

theorem permission21aExercised_intro
    {g : Person} {d : Person} {pr : Property} {c : ComplaintText}
    (hAddr : AddresseeProponentOfProof g c)
    (hElem : StolenOrCounterfeitNatureIsElement pr c)
    (hRep : OfficialRepresentationMade d pr c)
    (hBelief : DefendantBelievedPropertyOfSuchCharacter d pr c)
    (hAct : EstablishesElementByBeliefProof g d pr c) :
    Permission21aExercised g d pr c :=
  ⟨⟨hAddr, hElem, hRep, hBelief⟩, hAct⟩



theorem definition23_intro {ct : Court} {c : ComplaintText}
    (hIncluded : IsCourtOfTheUnitedStates ct c)
    (hNotDisplaced : ¬ OtherwiseExpresslyProvided c) : Definition23 ct c :=
  ⟨hIncluded, hNotDisplaced⟩



theorem federalHealthCareOffense_enumerated_intro
    {o : OffenseInstance} {c : ComplaintText}
    (h : ViolationOfEnumeratedHealthCareStatute o c) : FederalHealthCareOffense o c :=
  .enumerated h

theorem federalHealthCareOffense_conditioned_intro
    {o : OffenseInstance} {c : ComplaintText}
    (hViol : ViolationOfConditionedHealthCareStatute o c)
    (hRelated : RelatesToHealthCareBenefitProgram o c) : FederalHealthCareOffense o c :=
  .conditioned hViol hRelated

theorem definition24b_intro {e : Entity} {c : ComplaintText}
    (hProgram : IsHealthCareBenefitProgram e c) : Definition24b e c :=
  ⟨hProgram⟩



theorem prohibitedAct1028a_produce_intro
    {p : Person} {d : IdentificationObject} {c : ComplaintText}
    (h : ProhibitedAct1028a1 p d c) : ProhibitedAct1028a p d c := .produce h

theorem prohibitedAct1028a_transferStolen_intro
    {p : Person} {d : IdentificationObject} {c : ComplaintText}
    (h : ProhibitedAct1028a2 p d c) : ProhibitedAct1028a p d c := .transferStolen h

theorem prohibitedAct1028a_possessFiveOrMore_intro
    {p : Person} {d : IdentificationObject} {c : ComplaintText}
    (h : ProhibitedAct1028a3 p d c) : ProhibitedAct1028a p d c := .possessFiveOrMore h

theorem prohibitedAct1028a_possessToDefraudUS_intro
    {p : Person} {d : IdentificationObject} {c : ComplaintText}
    (h : ProhibitedAct1028a4 p d c) : ProhibitedAct1028a p d c := .possessToDefraudUS h

theorem prohibitedAct1028a_implement_intro
    {p : Person} {d : IdentificationObject} {c : ComplaintText}
    (h : ProhibitedAct1028a5 p d c) : ProhibitedAct1028a p d c := .implement h

theorem prohibitedAct1028a_possessUSDocument_intro
    {p : Person} {d : IdentificationObject} {c : ComplaintText}
    (h : ProhibitedAct1028a6 p d c) : ProhibitedAct1028a p d c := .possessUSDocument h

theorem prohibitedAct1028a_meansOfIdentification_intro
    {p : Person} {d : IdentificationObject} {c : ComplaintText}
    (h : ProhibitedAct1028a7 p d c) : ProhibitedAct1028a p d c :=
  .meansOfIdentification h

theorem prohibitedAct1028a_traffickingFeatures_intro
    {p : Person} {d : IdentificationObject} {c : ComplaintText}
    (h : ProhibitedAct1028a8 p d c) : ProhibitedAct1028a p d c :=
  .traffickingFeatures h



theorem circumstance1028c_federalAuthority_intro
    {p : Person} {d : IdentificationObject} {o : OffenseInstance} {c : ComplaintText}
    (h : Circumstance1028c1 d c) : Circumstance1028c p d o c := .federalAuthority h

theorem circumstance1028c_offenseUnderA4_intro
    {p : Person} {d : IdentificationObject} {o : OffenseInstance} {c : ComplaintText}
    (h : ProhibitedAct1028a4 p d c) : Circumstance1028c p d o c := .offenseUnderA4 h

theorem circumstance1028c_commerce_intro
    {p : Person} {d : IdentificationObject} {o : OffenseInstance} {c : ComplaintText}
    (h : AffectsInterstateOrForeignCommerce o c) : Circumstance1028c p d o c :=
  .commerce h

theorem circumstance1028c_mails_intro
    {p : Person} {d : IdentificationObject} {o : OffenseInstance} {c : ComplaintText}
    (h : TransportedInMailInCourseOfConduct d o c) : Circumstance1028c p d o c := .mails h



theorem prohibition1028a_intro
    {p : Person} {d : IdentificationObject} {o : OffenseInstance} {c : ComplaintText}
    (hAddr : AddresseeAnyPerson p c)
    (hCirc : Circumstance1028c p d o c) : Prohibition1028a p d o c :=
  ⟨hAddr, hCirc⟩

theorem prohibition1028aViolated_intro
    {p : Person} {d : IdentificationObject} {o : OffenseInstance} {c : ComplaintText}
    (hAddr : AddresseeAnyPerson p c)
    (hCirc : Circumstance1028c p d o c)
    (hAct : ProhibitedAct1028a p d c)
    (hNotExempt : ¬ ExemptAuthorizedLawEnforcementActivity p c) :
    Prohibition1028aViolated p d o c :=
  ⟨⟨hAddr, hCirc⟩, hAct, hNotExempt⟩

theorem prohibition1028f_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeAnyPerson p c) : Prohibition1028f p c :=
  ⟨hAddr⟩

theorem prohibition1028fViolated_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeAnyPerson p c)
    (hAct : AttemptedOrConspired1028f p c)
    (hNotExempt : ¬ ExemptAuthorizedLawEnforcementActivity p c) :
    Prohibition1028fViolated p c :=
  ⟨⟨hAddr⟩, hAct, hNotExempt⟩

theorem obligationPunish1028_intro
    {ct : Court} {p : Person} {o : OffenseInstance} {c : ComplaintText}
    (hAddr : AddresseeSentencingCourt ct c)
    (hCond : ConvictedOfViolation1028a p o c) : ObligationPunish1028 ct p o c :=
  ⟨hAddr, hCond⟩

theorem obligationPunish1028Breached_intro
    {ct : Court} {p : Person} {o : OffenseInstance} {c : ComplaintText}
    (hAddr : AddresseeSentencingCourt ct c)
    (hCond : ConvictedOfViolation1028a p o c)
    (hOmitted : ¬ PunishedAsProvided1028b ct p o c) :
    ObligationPunish1028Breached ct p o c :=
  ⟨⟨hAddr, hCond⟩, hOmitted⟩

theorem obligationForfeit1028h_intro
    {ct : Court} {p : Person} {o : OffenseInstance} {c : ComplaintText}
    (hAddr : AddresseeCourtOfConviction ct o c)
    (hCond : ConvictedOfViolation1028a p o c) : ObligationForfeit1028h ct p o c :=
  ⟨hAddr, hCond⟩

theorem obligationForfeit1028hBreached_intro
    {ct : Court} {p : Person} {o : OffenseInstance} {c : ComplaintText}
    (hAddr : AddresseeCourtOfConviction ct o c)
    (hCond : ConvictedOfViolation1028a p o c)
    (hOmitted : ¬ OrderedForfeitureAndDisposition1028h ct o c) :
    ObligationForfeit1028hBreached ct p o c :=
  ⟨⟨hAddr, hCond⟩, hOmitted⟩

theorem obligationForfeitureProcedure1028g_intro
    {ct : Court} {o : OffenseInstance} {c : ComplaintText}
    (hAddr : AddresseeForfeitingAuthority ct c)
    (hCond : ForfeitureUnderSection1028 o c) :
    ObligationForfeitureProcedure1028g ct o c :=
  ⟨hAddr, hCond⟩

theorem obligationForfeitureProcedure1028gBreached_intro
    {ct : Court} {o : OffenseInstance} {c : ComplaintText}
    (hAddr : AddresseeForfeitingAuthority ct c)
    (hCond : ForfeitureUnderSection1028 o c)
    (hOmitted : ¬ ForfeitureGovernedBySection413 o c) :
    ObligationForfeitureProcedure1028gBreached ct o c :=
  ⟨⟨hAddr, hCond⟩, hOmitted⟩

theorem definition1028i_intro {d : IdentificationObject} {c : ComplaintText}
    (hSingle : SingleDocumentBearingMultipleMeans d c) : Definition1028i d c :=
  ⟨hSingle⟩



theorem prohibitedAct1029a_counterfeitDevice_intro
    {p : Person} {dv : AccessDevice} {c : ComplaintText}
    (h : ProhibitedAct1029a1 p dv c) : ProhibitedAct1029a p dv c := .counterfeitDevice h

theorem prohibitedAct1029a_unauthorizedThreshold_intro
    {p : Person} {dv : AccessDevice} {c : ComplaintText}
    (h : ProhibitedAct1029a2 p dv c) : ProhibitedAct1029a p dv c :=
  .unauthorizedThreshold h

theorem prohibitedAct1029a_fifteenOrMore_intro
    {p : Person} {dv : AccessDevice} {c : ComplaintText}
    (h : ProhibitedAct1029a3 p dv c) : ProhibitedAct1029a p dv c := .fifteenOrMore h

theorem prohibitedAct1029a_deviceMakingEquipment_intro
    {p : Person} {dv : AccessDevice} {c : ComplaintText}
    (h : ProhibitedAct1029a4 p dv c) : ProhibitedAct1029a p dv c :=
  .deviceMakingEquipment h

theorem prohibitedAct1029a_transactionsAnothers_intro
    {p : Person} {dv : AccessDevice} {c : ComplaintText}
    (h : ProhibitedAct1029a5 p dv c) : ProhibitedAct1029a p dv c :=
  .transactionsAnothers h

theorem prohibitedAct1029a_solicitation_intro
    {p : Person} {dv : AccessDevice} {c : ComplaintText}
    (h : ProhibitedAct1029a6 p dv c) : ProhibitedAct1029a p dv c := .solicitation h

theorem prohibitedAct1029a_modifiedInstrument_intro
    {p : Person} {dv : AccessDevice} {c : ComplaintText}
    (h : ProhibitedAct1029a7 p dv c) : ProhibitedAct1029a p dv c :=
  .modifiedInstrument h

theorem prohibitedAct1029a_scanningReceiver_intro
    {p : Person} {dv : AccessDevice} {c : ComplaintText}
    (h : ProhibitedAct1029a8 p dv c) : ProhibitedAct1029a p dv c := .scanningReceiver h

theorem prohibitedAct1029a_configuredHardware_intro
    {p : Person} {dv : AccessDevice} {c : ComplaintText}
    (h : ProhibitedAct1029a9 p dv c) : ProhibitedAct1029a p dv c := .configuredHardware h

theorem prohibitedAct1029a_causedPresentment_intro
    {p : Person} {dv : AccessDevice} {c : ComplaintText}
    (h : ProhibitedAct1029a10 p dv c) : ProhibitedAct1029a p dv c := .causedPresentment h



theorem prohibition1029a_intro
    {p : Person} {o : OffenseInstance} {c : ComplaintText}
    (hAddr : AddresseeAnyPerson p c)
    (hCond : AffectsInterstateOrForeignCommerce o c) : Prohibition1029a p o c :=
  ⟨hAddr, hCond⟩

theorem prohibition1029aViolated_intro
    {p : Person} {dv : AccessDevice} {o : OffenseInstance} {c : ComplaintText}
    (hAddr : AddresseeAnyPerson p c)
    (hCond : AffectsInterstateOrForeignCommerce o c)
    (hAct : ProhibitedAct1029a p dv c)
    (hNotExempt : ¬ ExemptAuthorizedLawEnforcementActivity p c) :
    Prohibition1029aViolated p dv o c :=
  ⟨⟨hAddr, hCond⟩, hAct, hNotExempt⟩

theorem permission1029g1_intro {p : Person} {e : Entity} {c : ComplaintText}
    (hAddr : AddresseeCarrierAffiliate p e c)
    (hCarrier : IsFacilitiesBasedCarrier e c) : Permission1029g1 p e c :=
  ⟨hAddr, hCarrier⟩

theorem permission1029g1Available_intro {p : Person} {e : Entity} {c : ComplaintText}
    (hAddr : AddresseeCarrierAffiliate p e c)
    (hCarrier : IsFacilitiesBasedCarrier e c)
    (hAct : ProtectiveConductForCarrier p e c)
    (hNotTraffic : ¬ TraffickingConduct1029g1 p c)
    (hNotOtherCarrier : ¬ PurposeObtainAnotherCarriersService p c) :
    Permission1029g1Available p e c :=
  ⟨⟨hAddr, hCarrier⟩, hAct, hNotTraffic, hNotOtherCarrier⟩

theorem defense1029g2Established_intro {p : Person} {c : ComplaintText}
    (hDefense : ResearchOrDevelopmentDefenseEstablished p c)
    (hNotProducing : ¬ ProducingOrTrafficking1029g2 p c) : Defense1029g2Established p c :=
  ⟨hDefense, hNotProducing⟩

theorem prohibition1029a9Violated_intro
    {p : Person} {dv : AccessDevice} {e : Entity} {o : OffenseInstance}
    {c : ComplaintText}
    (hAddr : AddresseeAnyPerson p c)
    (hCond : AffectsInterstateOrForeignCommerce o c)
    (hAct : ProhibitedAct1029a9 p dv c)
    (hNotExempt : ¬ ExemptAuthorizedLawEnforcementActivity p c)
    (hNoPermission : ¬ Permission1029g1Available p e c)
    (hNoDefense : ¬ Defense1029g2Established p c) :
    Prohibition1029a9Violated p dv e o c :=
  ⟨⟨hAddr, hCond⟩, hAct, hNotExempt, hNoPermission, hNoDefense⟩

theorem prohibition1029b1_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeAnyPerson p c) : Prohibition1029b1 p c :=
  ⟨hAddr⟩

theorem prohibition1029b1Violated_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeAnyPerson p c)
    (hAct : Attempted1029b1 p c)
    (hNotExempt : ¬ ExemptAuthorizedLawEnforcementActivity p c) :
    Prohibition1029b1Violated p c :=
  ⟨⟨hAddr⟩, hAct, hNotExempt⟩

theorem prohibition1029b2_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeAnyPerson p c)
    (hCond : OvertActInFurtherance1029b2 c) : Prohibition1029b2 p c :=
  ⟨hAddr, hCond⟩

theorem prohibition1029b2Violated_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeAnyPerson p c)
    (hCond : OvertActInFurtherance1029b2 c)
    (hAct : PartyToConspiracy1029b2 p c)
    (hNotExempt : ¬ ExemptAuthorizedLawEnforcementActivity p c) :
    Prohibition1029b2Violated p c :=
  ⟨⟨hAddr, hCond⟩, hAct, hNotExempt⟩

theorem obligationPunish1029_intro
    {ct : Court} {p : Person} {o : OffenseInstance} {c : ComplaintText}
    (hAddr : AddresseeSentencingCourt ct c)
    (hCond : ConvictedOfViolation1029 p o c) : ObligationPunish1029 ct p o c :=
  ⟨hAddr, hCond⟩

theorem obligationPunish1029Breached_intro
    {ct : Court} {p : Person} {o : OffenseInstance} {c : ComplaintText}
    (hAddr : AddresseeSentencingCourt ct c)
    (hCond : ConvictedOfViolation1029 p o c)
    (hOmitted : ¬ PunishedAsProvided1029c ct p o c) :
    ObligationPunish1029Breached ct p o c :=
  ⟨⟨hAddr, hCond⟩, hOmitted⟩

theorem obligationForfeitureProcedure1029c2_intro
    {ct : Court} {p : Person} {o : OffenseInstance} {c : ComplaintText}
    (hAddr : AddresseeForfeitingAuthority ct c)
    (hCond : ConvictedOfViolation1029 p o c) :
    ObligationForfeitureProcedure1029c2 ct p o c :=
  ⟨hAddr, hCond⟩

theorem obligationForfeitureProcedure1029c2Breached_intro
    {ct : Court} {p : Person} {o : OffenseInstance} {c : ComplaintText}
    (hAddr : AddresseeForfeitingAuthority ct c)
    (hCond : ConvictedOfViolation1029 p o c)
    (hOmitted : ¬ ForfeitureGovernedBySection413 o c) :
    ObligationForfeitureProcedure1029c2Breached ct p o c :=
  ⟨⟨hAddr, hCond⟩, hOmitted⟩

theorem power1029dInvestigate_intro
    {a : Agency} {o : OffenseInstance} {c : ComplaintText}
    (hAddr : AddresseeSecretService a c)
    (hCompetence : HasAuthorityToInvestigate1029d a o c) :
    Power1029dInvestigate a o c :=
  ⟨hAddr, hCompetence⟩

theorem obligationEnterAgreement1029d_intro {a : Agency} {c : ComplaintText}
    (hAddr : AddresseeTreasuryAndAttorneyGeneral a c) :
    ObligationEnterAgreement1029d a c :=
  ⟨hAddr⟩

theorem obligationEnterAgreement1029dBreached_intro
    {a : Agency} {ag : Agreement} {c : ComplaintText}
    (hAddr : AddresseeTreasuryAndAttorneyGeneral a c)
    (hOmitted : ¬ InteragencyAgreementEntered ag c) :
    ObligationEnterAgreement1029dBreached a ag c :=
  ⟨⟨hAddr⟩, hOmitted⟩

theorem obligationExerciseUnderAgreement1029d_intro
    {a : Agency} {o : OffenseInstance} {c : ComplaintText}
    (hAddr : AddresseeSecretService a c)
    (hCond : HasAuthorityToInvestigate1029d a o c) :
    ObligationExerciseUnderAgreement1029d a o c :=
  ⟨hAddr, hCond⟩

theorem obligationExerciseUnderAgreement1029dBreached_intro
    {a : Agency} {ag : Agreement} {o : OffenseInstance} {c : ComplaintText}
    (hAddr : AddresseeSecretService a c)
    (hCond : HasAuthorityToInvestigate1029d a o c)
    (hOmitted : ¬ AuthorityExercisedInAccordanceWithAgreement a ag c) :
    ObligationExerciseUnderAgreement1029dBreached a ag o c :=
  ⟨⟨hAddr, hCond⟩, hOmitted⟩

theorem prohibition1029h_intro
    {p : Person} {dv : AccessDevice} {i : Institution} {c : ComplaintText}
    (hAddr : AddresseeAnyPerson p c)
    (hOutside : ActOutsideUnitedStatesJurisdiction p c)
    (hCond : DeviceLinkedToUnitedStatesEntity dv i c) : Prohibition1029h p dv i c :=
  ⟨hAddr, hOutside, hCond⟩

theorem prohibition1029hViolated_intro
    {p : Person} {dv : AccessDevice} {i : Institution} {c : ComplaintText}
    (hAddr : AddresseeAnyPerson p c)
    (hOutside : ActOutsideUnitedStatesJurisdiction p c)
    (hCond : DeviceLinkedToUnitedStatesEntity dv i c)
    (hAct : WouldConstituteOffenseUnder1029ab p dv c)
    (hNotExempt : ¬ ExemptAuthorizedLawEnforcementActivity p c) :
    Prohibition1029hViolated p dv i c :=
  ⟨⟨hAddr, hOutside, hCond⟩, hAct, hNotExempt⟩



theorem usNexusViaFinancialInstitution_intro
    {dv : AccessDevice} {i : Institution} {c : ComplaintText}
    (hInstitution : IsFinancialInstitution i c)
    (hLinked : DeviceLinkedToUnitedStatesEntity dv i c) :
    USNexusViaFinancialInstitution dv i c :=
  ⟨hInstitution, hLinked⟩

theorem creditCardSystemMemberNexus1029a10_intro
    {p : Person} {dv : AccessDevice} {e : Entity} {c : ComplaintText}
    (hMember : IsCreditCardSystemMember e c)
    (hAct : ProhibitedAct1029a10 p dv c) :
    CreditCardSystemMemberNexus1029a10 p dv e c :=
  ⟨hMember, hAct⟩

theorem meansOfIdentificationCount1028a7_intro
    {p : Person} {d : IdentificationObject} {c : ComplaintText}
    (hAct : ProhibitedAct1028a7 p d c)
    (hSingle : SingleDocumentBearingMultipleMeans d c) :
    MeansOfIdentificationCount1028a7 p d c :=
  ⟨hAct, hSingle⟩

end Proving.USC.T18.Ch1Ch47.Recert2.Deontic

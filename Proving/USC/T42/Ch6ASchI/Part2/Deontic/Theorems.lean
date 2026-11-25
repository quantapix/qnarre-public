import Proving.USC.T42.Ch6ASchI.Part2.Deontic.Statute







namespace Proving.USC.T42.Ch6ASchI.Part2.Deontic

open Proving.USC.Common



theorem obligation211_breached_intro {o : Officer} {c : ComplaintText}
    (hAddr : AddresseeQualifiedOfficer211 o c)
    (hCond : CompletedRequiredServiceYears211 o c)
    (hNoAct : ¬ PermanentPromotionGiven211 o c) : Obligation211Breached o c :=
  ⟨⟨hAddr, hCond⟩, hNoAct⟩

theorem prohibition211_violated_intro {o : Officer} {c : ComplaintText}
    (hAddr : AddresseeOfficerRegularCorps211 o c)
    (hCond : LacksOneYearInNextLowerGrade211 o c)
    (hAct : PromotedToRestrictedOrDirectorGrade211 o c) :
    Prohibition211Violated o c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩



theorem obligation211c_breached_intro {o : Officer} {c : ComplaintText}
    (hAddr : AddresseeQualifyingMedicalOfficer211c o c)
    (hCond : NoSimilarCreditReceived211c o c)
    (hNoAct : ¬ OneYearPromotionCreditGiven211c o c) : Obligation211cBreached o c :=
  ⟨⟨hAddr, hCond⟩, hNoAct⟩



theorem obligation212_breached_intro {o : Officer} {c : ComplaintText}
    (hAddr : AddresseeOfficerRegularCorps212 o c)
    (hAge : AttainedRetirementAge212 o c)
    (hApp : AppliedForRetirement212 o c)
    (hNoAct : ¬ RetiredOnApplication212 o c) : Obligation212Breached o c :=
  ⟨⟨hAddr, hAge, hApp⟩, hNoAct⟩

theorem power212_intro {o : Officer} {c : ComplaintText}
    (hAddr : AddresseeOfficerRegularCorps212 o c)
    (h30 : CompletedThirtyYearsService212 o c) : Power212 o c :=
  ⟨hAddr, h30⟩



theorem obligation213_breached_intro {o : Officer} {c : ComplaintText}
    (hAddr : AddresseeCommissionedOfficer213 o c)
    (hService : QualifyingActiveService213 o c)
    (hNoAct : ¬ MilitaryBenefitsAccorded213 o c) : Obligation213Breached o c :=
  ⟨⟨hAddr, hService⟩, hNoAct⟩

theorem power213Ribbons_intro {c : ComplaintText}
    (hAuth : PresidentAuthorizedRibbonConditions213 c) : Power213Ribbons c :=
  ⟨hAuth⟩



theorem obligation213a_breached_intro {o : Officer} {c : ComplaintText}
    (hBen : AddresseeCommissionedOfficer213a o c)
    (hNoAct : ¬ Title10RightsAccorded213a o c) : Obligation213aBreached o c :=
  ⟨⟨hBen⟩, hNoAct⟩



theorem obligation214_breached_intro {o : Officer} {c : ComplaintText}
    (hReleased : AddresseeReleasedForRetirement214 o c)
    (hNotPrev : ¬ PreviouslyPresentedFlag214 o c)
    (hNoAct : ¬ FlagPresented214 o c) : Obligation214Breached o c :=
  ⟨⟨hReleased, hNotPrev⟩, hNoAct⟩



theorem power215_exercised_intro {o : Officer} {c : ComplaintText}
    (hReq : RequestByExecutiveDepartmentHead215 c)
    (hDetailed : PersonnelDetailed215 o c) : Power215Exercised o c :=
  ⟨⟨hReq⟩, hDetailed⟩



theorem obligation216_breached_intro {c : ComplaintText}
    (hMatter : RegulatoryMatterUnderTitle216 c)
    (hNoAct : ¬ PresidentPrescribedRegulations216 c) : Obligation216Breached c :=
  ⟨⟨hMatter⟩, hNoAct⟩

theorem prohibition216_violated_intro {r : Regulation} {c : ComplaintText}
    (hDomain : RelatesToMedicalOfficerQualifications216 r c)
    (hAct : GivesPreferenceToSchoolOfMedicine216 r c) : Prohibition216Violated r c :=
  ⟨⟨hDomain⟩, hAct⟩



theorem power217_exercised_intro {c : ComplaintText}
    (hTrigger : InTimeOfWarOrEmergencyProclaimed217 c)
    (hAct : PresidentDeclaredCorpsMilitaryService217 c) : Power217Exercised c :=
  ⟨⟨hTrigger⟩, hAct⟩



theorem power217a_exercised_intro {a : AdvisoryCommittee} {c : ComplaintText}
    (hPurpose : ForPurposeOfAdvisingSecretary217a c)
    (hAct : SecretaryAppointedAdvisoryCouncil217a a c) : Power217aExercised a c :=
  ⟨⟨hPurpose⟩, hAct⟩



theorem prohibition217a1_violated_intro {a : AdvisoryCommittee} {c : ComplaintText}
    (hCovered : AppointmentToCoveredAdvisoryCommittee217a1 a c)
    (hAct : ConsideredPoliticalAffiliation217a1 a c) : Prohibition217a1Violated a c :=
  ⟨⟨hCovered⟩, hAct⟩

end Proving.USC.T42.Ch6ASchI.Part2.Deontic

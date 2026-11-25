



import Proving.USC.T18.Ch13.Reearn.Structure.Statute

set_option autoImplicit false

namespace Proving.USC.T18.Ch13.Reearn.Structure


theorem coherent245_intro {c : ComplaintText}
    (hStateJurisdictionSaved :
      SavingsClauseRespected edge245a1_savings_stateJurisdiction law245StateJurisdiction c)
    (hFederalInvestigationSaved :
      SavingsClauseRespected edge245a2_savings_federalInvestigation law245FederalInvestigation c)
    (hCertificationSatisfied :
      ConditionPrecedentSatisfied edge245b_subjectTo_245a1Certification c)
    (hFineScheduleExists : ReferencedSectionExists edge245b_incorporates_3571 c)
    (hFineScheduleHonored : IncorporationHonored edge245b_incorporates_3571 c)
    (hFederalActivities4A : IncorporationHonored edge245b4A_incorporates_245b1 c)
    (hStateActivities4A : IncorporationHonored edge245b4A_incorporates_245b2 c)
    (hFederalActivities5 : IncorporationHonored edge245b5_incorporates_245b1 c)
    (hStateActivities5 : IncorporationHonored edge245b5_incorporates_245b2 c)
    (hSpeechTerm :
      DefinedTermResolves edge245b5_incorporates_speechDefinition term245ParticipatingLawfully c)
    (hStateTerm : DefinedTermResolves edge245b_incorporates_245d term245State c)
    (hLawEnforcementTerm :
      DefinedTermResolves edge245c_incorporates_lawEnforcementOfficerDefinition
        term245LawEnforcementOfficer c)
    (hLawEnforcementCarveOut : ExceptionHonored edge245b_exceptAsProvided_245c c)
    (hProprietor2F : ExceptionHonored edge245b2F_exceptAsProvided_proprietorProviso c)
    (hProprietor4A : ExceptionHonored edge245b4A_exceptAsProvided_proprietorProviso c) :
    Coherent245 c :=
  { stateJurisdictionSaved := hStateJurisdictionSaved
  , federalInvestigationSaved := hFederalInvestigationSaved
  , certificationSatisfied := hCertificationSatisfied
  , fineScheduleExists := hFineScheduleExists
  , fineScheduleHonored := hFineScheduleHonored
  , federalActivitiesHonoredFor4A := hFederalActivities4A
  , stateActivitiesHonoredFor4A := hStateActivities4A
  , federalActivitiesHonoredFor5 := hFederalActivities5
  , stateActivitiesHonoredFor5 := hStateActivities5
  , speechTermResolves := hSpeechTerm
  , stateTermResolves := hStateTerm
  , lawEnforcementTermResolves := hLawEnforcementTerm
  , lawEnforcementCarveOutHonored := hLawEnforcementCarveOut
  , proprietorCarveOutHonoredFor2F := hProprietor2F
  , proprietorCarveOutHonoredFor4A := hProprietor4A }


theorem coherent247_intro {c : ComplaintText}
    (hCommerceCircumstance : IncorporationHonored edge247a_incorporates_247b c)
    (hPunishmentReferral : IncorporationHonored edge247a_incorporates_247d c)
    (hPunishmentBackReference : IncorporationHonored edge247d_incorporates_247ac c)
    (hFineScheduleExists : ReferencedSectionExists edge247d_incorporates_3571 c)
    (hFineScheduleHonored : IncorporationHonored edge247d_incorporates_3571 c)
    (hCertificationSatisfied : ConditionPrecedentSatisfied edge247a_subjectTo_247e c)
    (hReligiousPropertyTerm :
      DefinedTermResolves edge247a1_incorporates_247f term247ReligiousRealProperty c)
    (hLimitationSatisfied : ConditionPrecedentSatisfied edge247a_subjectTo_247g c)
    (hGeneralLimitationExists : ReferencedSectionExists edge247g_lexSpecialis_3282 c)
    (hSevenYearControls : LexSpecialisControls edge247g_lexSpecialis_3282 c) :
    Coherent247 c :=
  { commerceCircumstanceHonored := hCommerceCircumstance
  , punishmentReferralHonored := hPunishmentReferral
  , punishmentBackReferenceHonored := hPunishmentBackReference
  , fineScheduleExists := hFineScheduleExists
  , fineScheduleHonored := hFineScheduleHonored
  , certificationSatisfied := hCertificationSatisfied
  , religiousPropertyTermResolves := hReligiousPropertyTerm
  , limitationSatisfied := hLimitationSatisfied
  , generalLimitationExists := hGeneralLimitationExists
  , sevenYearPeriodControls := hSevenYearControls }


theorem coherent248_intro {c : ComplaintText}
    (hPenaltiesReferral : IncorporationHonored edge248a_incorporates_248b c)
    (hCivilRemediesReferral : IncorporationHonored edge248a_incorporates_248c c)
    (hDefinitionsReferral : IncorporationHonored edge248a_incorporates_248e c)
    (hFacilityTerm : DefinedTermResolves edge248a_incorporates_248e term248Facility c)
    (hInterfereWithTerm : DefinedTermResolves edge248a_incorporates_248e term248InterfereWith c)
    (hIntimidateTerm : DefinedTermResolves edge248a_incorporates_248e term248Intimidate c)
    (hPhysicalObstructionTerm :
      DefinedTermResolves edge248a_incorporates_248e term248PhysicalObstruction c)
    (hReproductiveHealthServicesTerm :
      DefinedTermResolves edge248a_incorporates_248e term248ReproductiveHealthServices c)
    (hStateTerm : DefinedTermResolves edge248a_incorporates_248e term248State c)
    (hParentGuardianCarveOut : ExceptionHonored edge248a_exceptAsProvided_parentGuardian c)
    (hFineScheduleExists : ReferencedSectionExists edge248b_notwithstanding_3571 c)
    (hFineOverrideHonored : OverrideHonored edge248b_notwithstanding_3571 c)
    (hPriorConviction : IncorporationHonored edge248b2_incorporates_248 c)
    (hFirstAmendmentReference : IncorporationHonored edge248a2_incorporates_firstAmendment c)
    (hExpressiveConductSaved :
      SavingsClauseRespected edge248d1_savings_firstAmendment law248FirstAmendmentConduct c)
    (hExistingRemediesSaved :
      SavingsClauseRespected edge248d2_savings_existingRemedies law248ExistingRemedies c)
    (hStateLocalSaved :
      SavingsClauseRespected edge248d3_savings_stateLocalLaw law248StateLocalConcurrent c)
    (hStateReproductiveSaved :
      SavingsClauseRespected edge248d4_savings_stateReproductiveRegulation
        law248StateReproductiveRegulation c) :
    Coherent248 c :=
  { penaltiesReferralHonored := hPenaltiesReferral
  , civilRemediesReferralHonored := hCivilRemediesReferral
  , definitionsReferralHonored := hDefinitionsReferral
  , facilityTermResolves := hFacilityTerm
  , interfereWithTermResolves := hInterfereWithTerm
  , intimidateTermResolves := hIntimidateTerm
  , physicalObstructionTermResolves := hPhysicalObstructionTerm
  , reproductiveHealthServicesTermResolves := hReproductiveHealthServicesTerm
  , stateTermResolves := hStateTerm
  , parentGuardianCarveOutHonored := hParentGuardianCarveOut
  , fineScheduleExists := hFineScheduleExists
  , fineOverrideHonored := hFineOverrideHonored
  , priorConvictionReferenceHonored := hPriorConviction
  , firstAmendmentReferenceHonored := hFirstAmendmentReference
  , expressiveConductSaved := hExpressiveConductSaved
  , existingRemediesSaved := hExistingRemediesSaved
  , stateLocalConcurrentLawSaved := hStateLocalSaved
  , stateReproductiveRegulationSaved := hStateReproductiveSaved }



theorem section247PunishmentPathResolves_intro {c : ComplaintText}
    (hCircumstance : IncorporationHonored edge247a_incorporates_247b c)
    (hPunishment : IncorporationHonored edge247a_incorporates_247d c) :
    Section247PunishmentPathResolves c :=
  .viaSubsectionA hCircumstance hPunishment



theorem section247PunishmentPathResolves_intro_viaSubsectionC {c : ComplaintText}
    (hObject : DefinedTermResolves edge247c_incorporates_247f term247ReligiousRealProperty c)
    (hPunishment : IncorporationHonored edge247c_incorporates_247d c) :
    Section247PunishmentPathResolves c :=
  .viaSubsectionC hObject hPunishment



theorem section248CivilEnforcementPathResolves_intro {c : ComplaintText}
    (hStanding : ConditionPrecedentSatisfied edge248c1A_subjectTo_248a1 c)
    (hRelief : IncorporationHonored edge248c1A_incorporates_248c1B c) :
    Section248CivilEnforcementPathResolves c :=
  .privateReproductiveServicesAction hStanding hRelief


theorem section248CivilEnforcementPathResolves_intro_placeOfWorship {c : ComplaintText}
    (hStanding : ConditionPrecedentSatisfied edge248c1A_subjectTo_248a2 c)
    (hRelief : IncorporationHonored edge248c1A_incorporates_248c1B c) :
    Section248CivilEnforcementPathResolves c :=
  .privatePlaceOfWorshipAction hStanding hRelief


theorem section248CivilEnforcementPathResolves_intro_unitedStates {c : ComplaintText}
    (hRelief : IncorporationHonored edge248c2B_incorporates_248c1B c) :
    Section248CivilEnforcementPathResolves c :=
  .unitedStatesAction hRelief


theorem section248CivilEnforcementPathResolves_intro_stateParensPatriae {c : ComplaintText}
    (hRelief : IncorporationHonored edge248c3B_incorporates_248c2B c) :
    Section248CivilEnforcementPathResolves c :=
  .stateParensPatriaeAction hRelief



theorem section248FinePathResolves_intro {c : ComplaintText}
    (hExists : ReferencedSectionExists edge248b_incorporates_3571 c)
    (hHonored : IncorporationHonored edge248b_incorporates_3571 c) :
    Section248FinePathResolves c :=
  .viaTitle18Schedule hExists hHonored



theorem section248FinePathResolves_intro_nonviolentObstructionCap {c : ComplaintText}
    (hTrigger : OverrideTriggered edge248b_notwithstanding_3571 c)
    (hHonored : OverrideHonored edge248b_notwithstanding_3571 c) :
    Section248FinePathResolves c :=
  .viaNonviolentObstructionCap hTrigger hHonored



theorem section245ExceptionPathApplies_intro {c : ComplaintText}
    (hTrigger : ExceptionApplies edge245b_exceptAsProvided_245c c)
    (hTerm : DefinedTermResolves edge245c_incorporates_lawEnforcementOfficerDefinition
              term245LawEnforcementOfficer c) :
    Section245ExceptionPathApplies c :=
  .lawEnforcementDuties hTrigger hTerm



theorem section245ExceptionPathApplies_intro_proprietor2F {c : ComplaintText}
    (hTrigger : ExceptionApplies edge245b2F_exceptAsProvided_proprietorProviso c) :
    Section245ExceptionPathApplies c :=
  .smallLodgingProprietorFor2F hTrigger



theorem section245ExceptionPathApplies_intro_proprietor4A {c : ComplaintText}
    (hTrigger : ExceptionApplies edge245b4A_exceptAsProvided_proprietorProviso c) :
    Section245ExceptionPathApplies c :=
  .smallLodgingProprietorFor4A hTrigger

end Proving.USC.T18.Ch13.Reearn.Structure

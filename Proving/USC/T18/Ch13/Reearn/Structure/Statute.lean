










import Proving.USC.T18.Ch13.Reearn.Structure.Predicates

set_option autoImplicit false

namespace Proving.USC.T18.Ch13.Reearn.Structure







structure Coherent245 (c : ComplaintText) : Prop where
  stateJurisdictionSaved :
    SavingsClauseRespected edge245a1_savings_stateJurisdiction law245StateJurisdiction c
  federalInvestigationSaved :
    SavingsClauseRespected edge245a2_savings_federalInvestigation law245FederalInvestigation c
  certificationSatisfied :
    ConditionPrecedentSatisfied edge245b_subjectTo_245a1Certification c
  fineScheduleExists :
    ReferencedSectionExists edge245b_incorporates_3571 c
  fineScheduleHonored :
    IncorporationHonored edge245b_incorporates_3571 c
  federalActivitiesHonoredFor4A :
    IncorporationHonored edge245b4A_incorporates_245b1 c
  stateActivitiesHonoredFor4A :
    IncorporationHonored edge245b4A_incorporates_245b2 c
  federalActivitiesHonoredFor5 :
    IncorporationHonored edge245b5_incorporates_245b1 c
  stateActivitiesHonoredFor5 :
    IncorporationHonored edge245b5_incorporates_245b2 c
  speechTermResolves :
    DefinedTermResolves edge245b5_incorporates_speechDefinition term245ParticipatingLawfully c
  stateTermResolves :
    DefinedTermResolves edge245b_incorporates_245d term245State c
  lawEnforcementTermResolves :
    DefinedTermResolves edge245c_incorporates_lawEnforcementOfficerDefinition term245LawEnforcementOfficer c
  lawEnforcementCarveOutHonored :
    ExceptionHonored edge245b_exceptAsProvided_245c c
  proprietorCarveOutHonoredFor2F :
    ExceptionHonored edge245b2F_exceptAsProvided_proprietorProviso c
  proprietorCarveOutHonoredFor4A :
    ExceptionHonored edge245b4A_exceptAsProvided_proprietorProviso c







structure Coherent247 (c : ComplaintText) : Prop where
  commerceCircumstanceHonored :
    IncorporationHonored edge247a_incorporates_247b c
  punishmentReferralHonored :
    IncorporationHonored edge247a_incorporates_247d c
  punishmentBackReferenceHonored :
    IncorporationHonored edge247d_incorporates_247ac c
  fineScheduleExists :
    ReferencedSectionExists edge247d_incorporates_3571 c
  fineScheduleHonored :
    IncorporationHonored edge247d_incorporates_3571 c
  certificationSatisfied :
    ConditionPrecedentSatisfied edge247a_subjectTo_247e c
  religiousPropertyTermResolves :
    DefinedTermResolves edge247a1_incorporates_247f term247ReligiousRealProperty c
  limitationSatisfied :
    ConditionPrecedentSatisfied edge247a_subjectTo_247g c
  generalLimitationExists :
    ReferencedSectionExists edge247g_lexSpecialis_3282 c
  sevenYearPeriodControls :
    LexSpecialisControls edge247g_lexSpecialis_3282 c








structure Coherent248 (c : ComplaintText) : Prop where
  penaltiesReferralHonored :
    IncorporationHonored edge248a_incorporates_248b c
  civilRemediesReferralHonored :
    IncorporationHonored edge248a_incorporates_248c c
  definitionsReferralHonored :
    IncorporationHonored edge248a_incorporates_248e c
  facilityTermResolves :
    DefinedTermResolves edge248a_incorporates_248e term248Facility c
  interfereWithTermResolves :
    DefinedTermResolves edge248a_incorporates_248e term248InterfereWith c
  intimidateTermResolves :
    DefinedTermResolves edge248a_incorporates_248e term248Intimidate c
  physicalObstructionTermResolves :
    DefinedTermResolves edge248a_incorporates_248e term248PhysicalObstruction c
  reproductiveHealthServicesTermResolves :
    DefinedTermResolves edge248a_incorporates_248e term248ReproductiveHealthServices c
  stateTermResolves :
    DefinedTermResolves edge248a_incorporates_248e term248State c
  parentGuardianCarveOutHonored :
    ExceptionHonored edge248a_exceptAsProvided_parentGuardian c
  fineScheduleExists :
    ReferencedSectionExists edge248b_notwithstanding_3571 c
  fineOverrideHonored :
    OverrideHonored edge248b_notwithstanding_3571 c
  priorConvictionReferenceHonored :
    IncorporationHonored edge248b2_incorporates_248 c
  firstAmendmentReferenceHonored :
    IncorporationHonored edge248a2_incorporates_firstAmendment c
  expressiveConductSaved :
    SavingsClauseRespected edge248d1_savings_firstAmendment law248FirstAmendmentConduct c
  existingRemediesSaved :
    SavingsClauseRespected edge248d2_savings_existingRemedies law248ExistingRemedies c
  stateLocalConcurrentLawSaved :
    SavingsClauseRespected edge248d3_savings_stateLocalLaw law248StateLocalConcurrent c
  stateReproductiveRegulationSaved :
    SavingsClauseRespected edge248d4_savings_stateReproductiveRegulation law248StateReproductiveRegulation c





inductive Section247PunishmentPathResolves (c : ComplaintText) : Prop where

  | viaSubsectionA
      (hCircumstance : IncorporationHonored edge247a_incorporates_247b c)
      (hPunishment : IncorporationHonored edge247a_incorporates_247d c) :
      Section247PunishmentPathResolves c


  | viaSubsectionC
      (hObject : DefinedTermResolves edge247c_incorporates_247f term247ReligiousRealProperty c)
      (hPunishment : IncorporationHonored edge247c_incorporates_247d c) :
      Section247PunishmentPathResolves c





inductive Section248CivilEnforcementPathResolves (c : ComplaintText) : Prop where

  | privateReproductiveServicesAction
      (hStanding : ConditionPrecedentSatisfied edge248c1A_subjectTo_248a1 c)
      (hRelief : IncorporationHonored edge248c1A_incorporates_248c1B c) :
      Section248CivilEnforcementPathResolves c

  | privatePlaceOfWorshipAction
      (hStanding : ConditionPrecedentSatisfied edge248c1A_subjectTo_248a2 c)
      (hRelief : IncorporationHonored edge248c1A_incorporates_248c1B c) :
      Section248CivilEnforcementPathResolves c

  | unitedStatesAction
      (hRelief : IncorporationHonored edge248c2B_incorporates_248c1B c) :
      Section248CivilEnforcementPathResolves c

  | stateParensPatriaeAction
      (hRelief : IncorporationHonored edge248c3B_incorporates_248c2B c) :
      Section248CivilEnforcementPathResolves c




inductive Section248FinePathResolves (c : ComplaintText) : Prop where

  | viaTitle18Schedule
      (hExists : ReferencedSectionExists edge248b_incorporates_3571 c)
      (hHonored : IncorporationHonored edge248b_incorporates_3571 c) :
      Section248FinePathResolves c


  | viaNonviolentObstructionCap
      (hTrigger : OverrideTriggered edge248b_notwithstanding_3571 c)
      (hHonored : OverrideHonored edge248b_notwithstanding_3571 c) :
      Section248FinePathResolves c



inductive Section245ExceptionPathApplies (c : ComplaintText) : Prop where


  | lawEnforcementDuties
      (hTrigger : ExceptionApplies edge245b_exceptAsProvided_245c c)
      (hTerm : DefinedTermResolves
                 edge245c_incorporates_lawEnforcementOfficerDefinition
                 term245LawEnforcementOfficer c) :
      Section245ExceptionPathApplies c

  | smallLodgingProprietorFor2F
      (hTrigger : ExceptionApplies edge245b2F_exceptAsProvided_proprietorProviso c) :
      Section245ExceptionPathApplies c

  | smallLodgingProprietorFor4A
      (hTrigger : ExceptionApplies edge245b4A_exceptAsProvided_proprietorProviso c) :
      Section245ExceptionPathApplies c

end Proving.USC.T18.Ch13.Reearn.Structure

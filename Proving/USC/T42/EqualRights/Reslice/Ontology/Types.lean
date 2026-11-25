








import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T42.EqualRights.Reslice.Ontology


abbrev ComplaintText := Proving.USC.Common.ComplaintText



abbrev Person := Proving.USC.Common.Person




abbrev Entity := Proving.USC.Common.Entity



opaque ProtectedActivity : Type



opaque ContractualActivity : Type



opaque Contract : Type



opaque Impairment : Type



opaque EmploymentPractice : Type


opaque Respondent : Type


opaque ComplainingParty : Type


opaque DiscriminatoryPractice : Type


opaque DamagesAward : Type



opaque Accommodation : Type



opaque PropertyTransaction : Type


opaque PropertyInterest : Type



opaque LawSource : Type


opaque Jurisdiction : Type



opaque SecuredRight : Type



opaque Proceeding : Type



opaque JudicialOfficer : Type


opaque Conspiracy : Type


opaque CoerciveMeans : Type



opaque OvertAct : Type



opaque Injury : Type



opaque Wrong1985 : Type


opaque LegalRepresentative : Type



opaque Action : Type



opaque FeeAward : Type



opaque RuleOfDecision : Type



opaque Court : Type










inductive Section1981Right where
  | makeAndEnforceContracts
  | sue
  | beParty
  | giveEvidence
  | fullAndEqualBenefitOfLaws
  | likeSubjectionToPunishmentAndExactions
  deriving DecidableEq, Repr



inductive ContractsAspect where
  | making
  | performance
  | modification
  | termination
  | enjoymentOfBenefitsPrivilegesTermsAndConditions
  deriving DecidableEq, Repr



inductive ComplainingPartyCase where
  | eeocUnderSubsectionA1
  | attorneyGeneralUnderSubsectionA1
  | titleVIIClaimantUnderSubsectionA1
  | eeocUnderSubsectionA2
  | attorneyGeneralUnderSubsectionA2
  | rehabAct794aClaimantUnderSubsectionA2
  | adaTitleIClaimantUnderSubsectionA2
  deriving DecidableEq, Repr



inductive RespondentSizeBand where
  | moreThan14FewerThan101
  | moreThan100FewerThan201
  | moreThan200FewerThan501
  | moreThan500
  deriving DecidableEq, Repr


inductive PropertyDealing where
  | inherit
  | purchase
  | lease
  | sell
  | hold
  | convey
  deriving DecidableEq, Repr


inductive PropertyKind where
  | real
  | personal
  deriving DecidableEq, Repr


inductive ColorOfLawSourceKind where
  | statute
  | ordinance
  | regulation
  | custom
  | usage
  deriving DecidableEq, Repr



inductive JurisdictionKind where
  | state
  | territory
  | districtOfColumbia
  deriving DecidableEq, Repr


inductive SecuredInterestKind where
  | right
  | privilege
  | immunity
  deriving DecidableEq, Repr



inductive RedressProceedingKind where
  | actionAtLaw
  | suitInEquity
  | otherProperProceedingForRedress
  deriving DecidableEq, Repr


inductive Section1985ConspiracyClass where

  | preventOfficeHolding


  | obstructFederalOfficerDuties


  | deterPartyOrWitness

  | influenceOrInjureJuror


  | obstructDueCourseOfJustice


  | depriveEqualProtection


  | hinderConstitutedAuthorities



  | interfereWithVoterAdvocacy
  deriving DecidableEq, Repr



inductive FeeEligibleStatute where
  | section1981
  | section1981a
  | section1982
  | section1983
  | section1985
  | section1986
  | titleIXOfPubL92_318
  | religiousFreedomRestorationAct
  | religiousLandUseAndInstitutionalizedPersonsAct
  | titleVIOfCivilRightsActOf1964
  | section12361OfTitle34
  deriving DecidableEq, Repr



inductive RuleOfDecisionKind where
  | lawsOfTheUnitedStates
  | stateCommonLawAsModified
  deriving DecidableEq, Repr

end Proving.USC.T42.EqualRights.Reslice.Ontology

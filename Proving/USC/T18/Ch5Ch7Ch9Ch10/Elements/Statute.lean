














import Proving.USC.T18.Ch5Ch7Ch9Ch10.Elements.Predicates

namespace Proving.USC.T18.Ch5Ch7Ch9Ch10.Elements

open Proving.USC.Common



structure Section81 (p : Person) (c : ComplaintText) : Prop where
  jurisdiction : WithinSpecialMaritimeTerritorialJurisdiction c
  mentalState  : ActedWillfullyAndMaliciously p c
  burning      : SetFireToCoveredProperty p c


structure Section81Aggravated (p : Person) (c : ComplaintText) : Prop where
  base       : Section81 p c
  aggravator : DwellingOrLifePlacedInJeopardy c



structure Section111 (p : Person) (c : ComplaintText) : Prop where
  conduct     : ForciblyAssaultedOrImpededOfficer p c
  victim      : VictimIsSection1114Officer c
  dutiesNexus : ActedWhileOrOnAccountOfOfficialDuties c



structure Section112 (p : Person) (c : ComplaintText) : Prop where
  conduct : CommittedViolentAttackOnProtectedPerson p c
  victim  : VictimIsProtectedForeignPerson c



structure Section113 (p : Person) (c : ComplaintText) : Prop where
  jurisdiction : WithinSpecialMaritimeTerritorialJurisdiction c
  assault      : CommittedAssault p c



structure Section114 (p : Person) (c : ComplaintText) : Prop where
  jurisdiction : WithinSpecialMaritimeTerritorialJurisdiction c
  intent       : ActedWithIntentToMaim p c
  maimingAct   : CommittedMaimingAct p c



structure Section115 (p : Person) (c : ComplaintText) : Prop where
  conduct : CommittedOrThreatenedViolenceAgainstTarget p c
  victim  : VictimIsUnitedStatesOfficialOrFamilyMember c
  intent  : ActedWithIntentToImpedeOrRetaliate p c



structure Section116 (p : Person) (c : ComplaintText) : Prop where
  scienter    : ActedWithScienter p c
  conduct     : PerformedFemaleGenitalMutilation p c
  minorVictim : VictimIsUnderEighteen c
  commerce    : AffectsInterstateOrForeignCommerce c
  noException : NoLicensedMedicalOperationException c



structure Section117 (p : Person) (c : ComplaintText) : Prop where
  jurisdiction : WithinSmtjOrIndianCountry c
  assault      : CommittedDomesticAssault p c
  recidivist   : HasTwoPriorQualifyingConvictions p c



structure Section118 (p : Person) (c : ComplaintText) : Prop where
  scienter : ActedWithScienter p c
  conduct  : ObstructedProtectiveFunctionAgent p c



structure Section119 (p : Person) (c : ComplaintText) : Prop where
  conduct : PubliclyReleasedRestrictedPersonalInfo p c
  victim  : VictimIsCoveredPerson c
  intent  : ActedWithIntentToThreatenOrIncite p c



structure Section152 (p : Person) (c : ComplaintText) : Prop where
  scienter    : ActedKnowinglyAndFraudulently p c
  conduct     : CommittedProhibitedBankruptcyAct p c
  title11Case : InConnectionWithTitle11Case c



structure Section153 (p : Person) (c : ComplaintText) : Prop where
  fiduciary : IsEstateFiduciaryWithAccess p c
  scienter  : ActedKnowinglyAndFraudulently p c
  conduct   : EmbezzledEstateProperty p c



structure Section154 (p : Person) (c : ComplaintText) : Prop where
  officer  : IsCourtOfficerOfEstate p c
  scienter : ActedWithScienter p c
  conduct  : CommittedAdverseInterestAct p c



structure Section155 (p : Person) (c : ComplaintText) : Prop where
  partyInInterest : IsPartyInInterest p c
  scienter        : ActedKnowinglyAndFraudulently p c
  conduct         : EnteredFraudulentFeeAgreement p c
  title11Case     : InConnectionWithTitle11Case c



structure Section156 (p : Person) (c : ComplaintText) : Prop where
  preparer   : IsBankruptcyPetitionPreparer p c
  disregard  : DisregardedBankruptcyRequirements p c
  dismissal  : CaseDismissedForPreparerMisconduct c



structure Section157 (p : Person) (c : ComplaintText) : Prop where
  scheme       : DevisedSchemeToDefraud p c
  furtherance  : CommittedActInFurtheranceOfScheme p c



inductive Section175 (p : Person) (m : BiologicalMaterial) (c : ComplaintText) : Prop where

  | forUseAsWeapon
      (hSci : ActedWithScienter p c)
      (hAct : DevelopedBiologicalAgentForUseAsWeapon p m c) : Section175 p m c

  | unjustifiedPossession
      (hSci : ActedWithScienter p c)
      (hAct : PossessedUnjustifiedBiologicalAgent p m c) : Section175 p m c



structure Section175b (p : Person) (m : BiologicalMaterial) (c : ComplaintText) : Prop where
  restricted  : IsRestrictedPerson p c
  selectAgent : IsSelectBiologicalAgent m c
  scienter    : ActedWithScienter p c
  conduct     : ShippedOrPossessedSelectAgent p m c
  commerce    : AffectsInterstateOrForeignCommerce c



structure Section175c (p : Person) (c : ComplaintText) : Prop where
  scienter     : ActedWithScienter p c
  conduct      : HandledVariolaVirus p c
  isVariola    : MaterialIsVariolaVirus c
  noHhsAuth    : NotAuthorizedBySecretaryHHS c
  jurisdiction : FederalJurisdictionalNexus c



structure Section176 (m : BiologicalMaterial) (c : ComplaintText) : Prop where
  forfeitable : PropertySubjectToForfeiture m c
  noDefense   : NoPeacefulPurposeJustification m c



structure Section177 (m : BiologicalMaterial) (c : ComplaintText) : Prop where
  enjoinable : ConductSubjectToInjunction c
  noDefense  : NoPeacefulPurposeJustification m c

end Proving.USC.T18.Ch5Ch7Ch9Ch10.Elements

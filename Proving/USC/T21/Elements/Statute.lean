import Proving.USC.T21.Elements.Types
import Proving.USC.T21.Elements.Predicates
import Proving.USC.Common.Types
import Proving.USC.Common.Predicates







namespace Proving.USC.T21.Elements

open Proving.USC.Common



inductive IntentToTransfer (p : Person) (s : Substance) (c : ComplaintText) : Prop where
  | manufacture (h : IntendedToManufacture p s c)
  | distribute  (h : IntendedToDistribute p s c)
  | dispense    (h : IntendedToDispense p s c)



inductive IntentToDistributeOrDispense (p : Person) (s : Substance) (c : ComplaintText) : Prop where
  | distribute (h : IntendedToDistribute p s c)
  | dispense   (h : IntendedToDispense p s c)



inductive Act841a1 (p : Person) (s : Substance) (c : ComplaintText) : Prop where
  | manufactured        (h : ManufacturedSubstance p s c)
  | distributed         (h : DistributedSubstance p s c)
  | dispensed           (h : DispensedSubstance p s c)
  | possessedWithIntent (h₁ : PossessedSubstance p s c) (h₂ : IntentToTransfer p s c)



inductive Act841a2 (p : Person) (s : Substance) (c : ComplaintText) : Prop where
  | created             (h : CreatedSubstance p s c)
  | distributed         (h : DistributedSubstance p s c)
  | dispensed           (h : DispensedSubstance p s c)
  | possessedWithIntent (h₁ : PossessedSubstance p s c) (h₂ : IntentToDistributeOrDispense p s c)



structure Section841a1 (p : Person) (s : Substance) (c : ComplaintText) : Prop where
  scienter      : ActedWithScienter p c
  controlled    : IsControlledSubstance s c
  act           : Act841a1 p s c
  notAuthorized : ¬ AuthorizedBySubchapter p c


structure Section841a2 (p : Person) (s : Substance) (c : ComplaintText) : Prop where
  scienter      : ActedWithScienter p c
  counterfeit   : IsCounterfeitSubstance s c
  act           : Act841a2 p s c
  notAuthorized : ¬ AuthorizedBySubchapter p c


inductive Section841a (p : Person) (s : Substance) (c : ComplaintText) : Prop where
  | controlled  (h : Section841a1 p s c)
  | counterfeit (h : Section841a2 p s c)




inductive QuantityTier841b1A (s : Substance) (c : ComplaintText) : Prop where
  | heroin           (h₁ : ContainsDrugKind s .heroin c)          (h₂ : MixtureQuantityAtLeast s 1000 c)
  | cocaine          (h₁ : ContainsDrugKind s .cocaine c)         (h₂ : MixtureQuantityAtLeast s 5000 c)
  | cocaineBase      (h₁ : ContainsDrugKind s .cocaineBase c)     (h₂ : MixtureQuantityAtLeast s 280 c)
  | pcpPure          (h₁ : ContainsDrugKind s .pcp c)             (h₂ : PureQuantityAtLeast s 100 c)
  | pcpMixture       (h₁ : ContainsDrugKind s .pcp c)             (h₂ : MixtureQuantityAtLeast s 1000 c)
  | lsd              (h₁ : ContainsDrugKind s .lsd c)             (h₂ : MixtureQuantityAtLeast s 10 c)
  | fentanyl         (h₁ : ContainsDrugKind s .fentanyl c)        (h₂ : MixtureQuantityAtLeast s 400 c)
  | fentanylRelated  (h₁ : ContainsDrugKind s .fentanylRelated c) (h₂ : MixtureQuantityAtLeast s 100 c)
  | marihuanaMixture (h₁ : ContainsDrugKind s .marihuana c)       (h₂ : MixtureQuantityAtLeast s 1000000 c)
  | marihuanaPlants  (h₁ : ContainsDrugKind s .marihuana c)       (h₂ : PlantCountAtLeast s 1000 c)
  | methPure         (h₁ : ContainsDrugKind s .methamphetamine c) (h₂ : PureQuantityAtLeast s 50 c)
  | methMixture      (h₁ : ContainsDrugKind s .methamphetamine c) (h₂ : MixtureQuantityAtLeast s 500 c)



inductive QuantityTier841b1B (s : Substance) (c : ComplaintText) : Prop where
  | heroin           (h₁ : ContainsDrugKind s .heroin c)          (h₂ : MixtureQuantityAtLeast s 100 c)
  | cocaine          (h₁ : ContainsDrugKind s .cocaine c)         (h₂ : MixtureQuantityAtLeast s 500 c)
  | cocaineBase      (h₁ : ContainsDrugKind s .cocaineBase c)     (h₂ : MixtureQuantityAtLeast s 28 c)
  | pcpPure          (h₁ : ContainsDrugKind s .pcp c)             (h₂ : PureQuantityAtLeast s 10 c)
  | pcpMixture       (h₁ : ContainsDrugKind s .pcp c)             (h₂ : MixtureQuantityAtLeast s 100 c)
  | lsd              (h₁ : ContainsDrugKind s .lsd c)             (h₂ : MixtureQuantityAtLeast s 1 c)
  | fentanyl         (h₁ : ContainsDrugKind s .fentanyl c)        (h₂ : MixtureQuantityAtLeast s 40 c)
  | fentanylRelated  (h₁ : ContainsDrugKind s .fentanylRelated c) (h₂ : MixtureQuantityAtLeast s 10 c)
  | marihuanaMixture (h₁ : ContainsDrugKind s .marihuana c)       (h₂ : MixtureQuantityAtLeast s 100000 c)
  | marihuanaPlants  (h₁ : ContainsDrugKind s .marihuana c)       (h₂ : PlantCountAtLeast s 100 c)
  | methPure         (h₁ : ContainsDrugKind s .methamphetamine c) (h₂ : PureQuantityAtLeast s 5 c)
  | methMixture      (h₁ : ContainsDrugKind s .methamphetamine c) (h₂ : MixtureQuantityAtLeast s 50 c)



structure AggravatedViolation841b1A (p : Person) (s : Substance) (c : ComplaintText) : Prop where
  violation : Section841a p s c
  quantity  : QuantityTier841b1A s c


structure AggravatedViolation841b1B (p : Person) (s : Substance) (c : ComplaintText) : Prop where
  violation : Section841a p s c
  quantity  : QuantityTier841b1B s c



structure Section841c1 (p : Person) (s : Substance) (c : ComplaintText) : Prop where
  scienter      : ActedWithScienter p c
  listed        : IsListedChemical s c
  possessed     : PossessedSubstance p s c
  intent        : IntendedToManufacture p s c
  notAuthorized : ¬ AuthorizedBySubchapter p c


inductive PossessedOrDistributed (p : Person) (s : Substance) (c : ComplaintText) : Prop where
  | possessed   (h : PossessedSubstance p s c)
  | distributed (h : DistributedSubstance p s c)



structure Section841c2 (p : Person) (s : Substance) (c : ComplaintText) : Prop where
  scienter      : ActedWithScienter p c
  listed        : IsListedChemical s c
  act           : PossessedOrDistributed p s c
  knewUse       : KnewChemicalWouldBeUsedToManufacture p s c
  notAuthorized : ¬ AuthorizedBySubchapter p c



structure Section841c3 (p : Person) (s : Substance) (c : ComplaintText) : Prop where
  scienter     : ActedWithScienter p c
  listed       : IsListedChemical s c
  evasionIntent : IntendedToEvadeRecordkeeping p c
  act          : ReceivedOrDistributedReportableAmountInSmallUnits p s c


inductive Section841c (p : Person) (s : Substance) (c : ComplaintText) : Prop where
  | possessionWithIntent (h : Section841c1 p s c)
  | knowingSupply        (h : Section841c2 p s c)
  | recordkeepingEvasion (h : Section841c3 p s c)



structure Section841d1 (p : Person) (c : ComplaintText) : Prop where
  placed          : PlacedOrMaintainedBoobytrap p c
  federalProperty : SiteIsFederalProperty c
  drugActivity    : ControlledSubstanceActivityAtSite c



structure Section841f1 (p : Person) (s : Substance) (c : ComplaintText) : Prop where
  scienter      : ActedWithScienter p c
  listed        : IsListedChemical s c
  distributed   : DistributedSubstance p s c
  notAuthorized : ¬ AuthorizedBySubchapter p c



structure Section841f2 (p : Person) (s : Substance) (c : ComplaintText) : Prop where
  possessed        : PossessedSubstance p s c
  listed           : IsListedChemical s c
  knewRecordLapse  : KnewRecordkeepingNotAdheredTo p s c
  failedToRemedy   : FailedToRemedyViolation p c



inductive KnewInternetSaleUnlawful (p : Person) (s : Substance) (c : ComplaintText) : Prop where
  | criminalSexualConduct (h : KnewWouldBeUsedInSexualCrime p s c)
  | unauthorizedPurchaser (h : KnewBuyerNotAuthorizedPurchaser p s c)



structure Section841g1 (p : Person) (s : Substance) (c : ComplaintText) : Prop where
  usedInternet : UsedInternetToDistribute p s c
  dateRapeDrug : IsDateRapeDrug s c
  knewUnlawful : KnewInternetSaleUnlawful p s c


inductive Act841h (p : Person) (s : Substance) (c : ComplaintText) : Prop where
  | delivered      (h : UsedInternetToDistribute p s c)
  | aidedOrAbetted (h : AidedOrAbettedInternetDistribution p c)



structure Section841h (p : Person) (s : Substance) (c : ComplaintText) : Prop where
  scienter      : ActedWithScienter p c
  controlled    : IsControlledSubstance s c
  act           : Act841h p s c
  notAuthorized : ¬ AuthorizedBySubchapter p c
  noSafeHarbor  : ¬ WithinInternetSafeHarbor p c



structure Attempt846 (p : Person) (c : ComplaintText) : Prop where
  intent          : IntendedToCommitPredicateOffense p c
  substantialStep : TookSubstantialStep p c



structure Conspiracy846 (p : Person) (ag : Agreement) (c : ComplaintText) : Prop where
  agreement     : AgreementAmongTwoOrMore ag c
  joined        : KnowinglyJoinedAgreement p ag c
  objectOffense : ObjectWasSubchapterOffense ag c


inductive Section846 (p : Person) (ag : Agreement) (c : ComplaintText) : Prop where
  | attempt    (h : Attempt846 p c)
  | conspiracy (h : Conspiracy846 p ag c)

end Proving.USC.T21.Elements

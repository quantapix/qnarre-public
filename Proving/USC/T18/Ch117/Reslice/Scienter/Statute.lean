






import Proving.USC.T18.Ch117.Reslice.Scienter.Types
import Proving.USC.T18.Ch117.Reslice.Scienter.Predicates
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch117.Reslice.Scienter

open Proving.USC.Common








def MeetsRequirement (p : Person) (prov : Provision) (c : ComplaintText) : Prop :=
  ∃ req : MentalState, ∃ rung : MentalState,
    RequiredMentalState prov = some req ∧ rung.atLeast req ∧ MentalStateProven p prov rung c



def DefenseEstablished (p : Person) (d : Defense) (c : ComplaintText) : Prop :=
  AffirmativeDefenseEstablished p d (RequiredStandard d) c






structure Scienter2421Aa (p : Person) (s : InteractiveComputerService)
    (c : ComplaintText) : Prop where

  rungMet : MeetsRequirement p .s2421A_a c

  objectOfIntent : IntentToPromoteOrFacilitateProstitution p s c


structure Scienter2421AbChapeau (p : Person) (s : InteractiveComputerService)
    (c : ComplaintText) : Prop where
  rungMet : MeetsRequirement p .s2421A_bChapeau c
  objectOfIntent : IntentToPromoteOrFacilitateProstitution p s c




structure Scienter2421Ab1 (p : Person) (s : InteractiveComputerService)
    (c : ComplaintText) : Prop where
  chapeau : Scienter2421AbChapeau p s c
  countElement : MeetsRequirement p .s2421A_b1 c





structure Scienter2421Ab2 (p : Person) (s : InteractiveComputerService)
    (c : ComplaintText) : Prop where
  chapeau : Scienter2421AbChapeau p s c
  recklessDisregard : MeetsRequirement p .s2421A_b2 c


inductive Aggravated2421AScienter (p : Person) (s : InteractiveComputerService)
    (c : ComplaintText) : Prop where
  | fiveOrMore   (h : Scienter2421Ab1 p s c) : Aggravated2421AScienter p s c
  | recklessTrafficking (h : Scienter2421Ab2 p s c) : Aggravated2421AScienter p s c



structure Culpable2421Aa (p : Person) (s : InteractiveComputerService)
    (c : ComplaintText) : Prop where
  scienter : Scienter2421Aa p s c
  defenseNotEstablished : ¬ DefenseEstablished p .jurisdictionLegality2421Ae c



structure Culpable2421Ab1 (p : Person) (s : InteractiveComputerService)
    (c : ComplaintText) : Prop where
  scienter : Scienter2421Ab1 p s c
  defenseNotEstablished : ¬ DefenseEstablished p .jurisdictionLegality2421Ae c



def Culpable2421Ab2 (p : Person) (s : InteractiveComputerService)
    (c : ComplaintText) : Prop := Scienter2421Ab2 p s c










structure Scienter2423a (p : Person) (v : Person) (t : Conveyance)
    (c : ComplaintText) : Prop where
  knowingTransport : MeetsRequirement p .s2423_aTransport c
  purposeRung : MeetsRequirement p .s2423_aPurpose c
  objectOfPurpose : IntentThatIndividualEngageInProhibitedSexualActivity p v c
  concurrence : IntentConcurrentWithConveyance p t c



structure Scienter2423b (p : Person) (k : IllicitSexualConduct) (t : Conveyance)
    (c : ComplaintText) : Prop where
  rungMet : MeetsRequirement p .s2423_b c
  objectOfIntent : IntentToEngageInIllicitSexualConduct p k c
  concurrence : IntentConcurrentWithConveyance p t c




def Scienter2423c (p : Person) (c : ComplaintText) : Prop :=
  MeetsRequirement p .s2423_c c




structure Scienter2423d (p : Person) (e : Entity) (k : IllicitSexualConduct)
    (c : ComplaintText) : Prop where
  rungMet : MeetsRequirement p .s2423_d c
  furtherance : PurposeOfIllicitSexualConductThroughOrganization p e k c




structure Scienter2423e (p : Person) (t : Person) (c : ComplaintText) : Prop where
  gainRung : MeetsRequirement p .s2423_eGain c
  gainObject : PurposeOfCommercialAdvantageOrPrivateFinancialGain p c
  knowledgeRung : MeetsRequirement p .s2423_eKnowledge c
  knowledgeObject : KnowledgeOfTravelersIllicitIntent p t c


inductive Scienter2423 (p : Person) (c : ComplaintText) : Prop where
  | transportMinor (v : Person) (t : Conveyance) (h : Scienter2423a p v t c) : Scienter2423 p c
  | travelWithIntent (k : IllicitSexualConduct) (t : Conveyance)
      (h : Scienter2423b p k t c) : Scienter2423 p c
  | engagedAbroad (h : Scienter2423c p c) : Scienter2423 p c
  | organisationalNexus (e : Entity) (k : IllicitSexualConduct)
      (h : Scienter2423d p e k c) : Scienter2423 p c
  | facilitationForGain (t : Person) (h : Scienter2423e p t c) : Scienter2423 p c






def Scienter2423f (p : Person) (c : ComplaintText) : Prop := Scienter2423 p c



structure Defense2423i (p : Person) (c : ComplaintText) : Prop where
  posture : ProsecutionRestsOnCommercialSexActTheory c
  carried : DefenseEstablished p .reasonableBeliefAdult2423i c



structure Culpable2423 (p : Person) (c : ComplaintText) : Prop where
  scienter : Scienter2423 p c
  defenseNotEstablished : ¬ Defense2423i p c

end Proving.USC.T18.Ch117.Reslice.Scienter

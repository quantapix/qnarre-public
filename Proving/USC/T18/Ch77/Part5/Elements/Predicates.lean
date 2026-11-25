import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T18.Ch77.Part5.Elements.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch77.Part5.Elements

open Proving.USC.Common








axiom Recruits (d : Person) (act : TraffickingAct) (v : Person) (c : ComplaintText) : Prop



axiom Entices (d : Person) (act : TraffickingAct) (v : Person) (c : ComplaintText) : Prop



axiom Harbors (d : Person) (act : TraffickingAct) (v : Person) (c : ComplaintText) : Prop



axiom Transports (d : Person) (act : TraffickingAct) (v : Person) (c : ComplaintText) : Prop



axiom Provides (d : Person) (act : TraffickingAct) (v : Person) (c : ComplaintText) : Prop



axiom Obtains (d : Person) (act : TraffickingAct) (v : Person) (c : ComplaintText) : Prop



axiom Advertises (d : Person) (act : TraffickingAct) (v : Person) (c : ComplaintText) : Prop



axiom Maintains (d : Person) (act : TraffickingAct) (v : Person) (c : ComplaintText) : Prop



axiom Patronizes (d : Person) (act : TraffickingAct) (v : Person) (c : ComplaintText) : Prop



axiom Solicits (d : Person) (act : TraffickingAct) (v : Person) (c : ComplaintText) : Prop






axiom InOrAffectingInterstateOrForeignCommerce (act : TraffickingAct) (c : ComplaintText) : Prop




axiom WithinSpecialMaritimeAndTerritorialJurisdiction (act : TraffickingAct) (c : ComplaintText) : Prop






axiom KnowsOfProhibitedCircumstance (d : Person) (v : Person) (c : ComplaintText) : Prop



axiom RecklesslyDisregardsProhibitedCircumstance (d : Person) (v : Person) (c : ComplaintText) : Prop




axiom ViolatingActIsAdvertising (act : TraffickingAct) (c : ComplaintText) : Prop





axiom HadReasonableOpportunityToObservePerson (d : Person) (v : Person) (c : ComplaintText) : Prop





axiom MeansOfForce (d : Person) (v : Person) (c : ComplaintText) : Prop



axiom MeansOfThreatsOfForce (d : Person) (v : Person) (c : ComplaintText) : Prop



axiom MeansOfFraud (d : Person) (v : Person) (c : ComplaintText) : Prop






axiom ThreatsOfSeriousHarmOrPhysicalRestraint (v : Person) (c : ComplaintText) : Prop





axiom SchemeCausingBeliefOfSeriousHarmOrRestraint (v : Person) (c : ComplaintText) : Prop




axiom AbuseOrThreatenedAbuseOfLawOrLegalProcess (v : Person) (c : ComplaintText) : Prop





axiom IsSexAct (sx : SexAct) (c : ComplaintText) : Prop




axiom AnythingOfValueGivenOrReceived (sx : SexAct) (c : ComplaintText) : Prop



axiom WillBeCausedToEngageInSexAct (v : Person) (sx : SexAct) (c : ComplaintText) : Prop







axiom ageOfPersonAtOffense (v : Person) (c : ComplaintText) : Nat






axiom BenefitsFinanciallyOrReceivesAnythingOfValue (d : Person) (ven : Venture) (c : ComplaintText) : Prop




axiom ParticipatesInVenture (d : Person) (ven : Venture) (c : ComplaintText) : Prop



axiom GroupOfTwoOrMoreIndividuals (ven : Venture) (c : ComplaintText) : Prop




axiom AssociatedInFact (ven : Venture) (c : ComplaintText) : Prop




axiom VentureEngagedInAct1591a1 (ven : Venture) (act : TraffickingAct) (c : ComplaintText) : Prop







axiom OffenseEffectedByProhibitedMeans (d : Person) (v : Person) (c : ComplaintText) : Prop





axiom ObstructsEnforcement (d : Person) (oa : ObstructiveAct) (c : ComplaintText) : Prop



axiom AttemptsToObstructEnforcement (d : Person) (oa : ObstructiveAct) (c : ComplaintText) : Prop




axiom InterferesWithOrPreventsEnforcement (d : Person) (oa : ObstructiveAct) (c : ComplaintText) : Prop

end Proving.USC.T18.Ch77.Part5.Elements

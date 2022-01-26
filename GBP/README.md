# GBP - Global Betting Platform

The open source model platform that handles betting. It is made up of 'capabilities', which are a set of services that provide a related set of features. Each feature is refered to as a TLA (Three-lettered-acroymn - although they don't all have three letters!)

* [GBP API Doc - GitHub](https://github.com/Flutter-Global/product-global-betting-platform/blob/master/product/platform/Overview.md)

## Requirements

* Swift 5.5+

## Contents

Table of Contents:

- [Sportsbook BFF - Backend-for-Frontend](#sportsbook-bff---backend-for-frontend)
  - [Requirements](#requirements)
  - [Setup](#setup)
  - [Development](#development)
  - [GBP - Global Betting Platform](#gbp---global-betting-platform)
    - [Capabilities](#capabilities)
      - [Product Catalogue Navigation](#product-catalogue-navigation)
        - [SCAN - Sports Catalogue Navigator](#scan---sports-catalogue-navigator)
      - [Bets Building and Placement](#bets-building-and-placement)
        - [SIB - Sportsbook Imply Bets](#sib---sportsbook-imply-bets)

## Capabilities

### Product Catalogue Navigation

Describes the ability that the platform has to make the Product Catalogue data navigable to customers / channels.

#### SCAN - Sports Catalogue Navigator

<https://github.com/Flutter-Global/cap-product-catalogue-navigation/blob/master/api/scan/SCAN-IDD.md>

[Faceted Search](https://en.wikipedia.org/wiki/Faceted_search) provides the ability to search for markets that match a search criteria, return a (sub)set of the results, and at the same time, categorise the entire matching set by user selected categories (Facets).  Each facet will identify the number of results (Cardinality) that match that facet. For an example of faceting in action, go to [ebay](https://ebay.co.uk) and perform a search. The search results are presented as facets, with each facet indicating the number of matching items.

A search request can be built using the [Facet API request builder](http://xtt.nxt.internal/facet_builder/facet_builder.html).

A faceted search has the following parts:

* **FilterQuery**
  * Provides the selection criteria, markets that match the given criteria are returned in the search results.
* **SelectBy**
  * How to rank the results, in order restrict the number of results returned.
* **MaxResults**
  * The maximum number of results to return.
* **Attachments**
  * As some entities are referenced multiple times, for example markets belonging to the same event, a reference id is presented in place of the entity. The full details of the entity are then provided as attachments.   Use this to select which attachments should be present in the result set.
  * This only affects entities referenced in the result set, entities referenced by facets are always returned as attachments.
* **Facets**
  * Selects how the results that match the selection criteria should be categorised.
  * Facets may be either
    * Simple - All possible values for the facet are faceted
    * Range - The values assigned to the facet are those that fall within the date range.
    * Constrained - Only the values that match the supplied constaints are faceted.
    * Tree - Provide a sub facet.

### Bets Building and Placement

#### SIB - Sportsbook Imply Bets

<https://github.com/Flutter-Global/cap-bet-building-and-placement/blob/master/api/sib/SIB-IDD.md>

Construction of dynamic betting opportunities (including bet types like Same Game multiples).

### Product Catalogue

#### SMP - Sportsbook Market Prices

<https://github.com/Flutter-Global/cap-product-catalogue/blob/master/api/smp/SMP-IDD.md>

Sports Event Catalogue exposure to the customer. Provides the most updated Sportsbook price information for each betting outcome.

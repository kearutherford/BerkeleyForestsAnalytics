
# Berkeley Forest Analytics

The `UCBForestAnalytics` package is a suite of open-source R functions
designed to produce standard metrics for forest management and ecology
from field inventory data.

## Installation instructions

To install the `UCBForestAnalytics` package from GitHub:

``` r
# install and load devtools
install.packages("devtools")
library(devtools)
```

``` r
# install and load Rbiomass
devtools::install_github('kearutherford/Rbiomass')
library(Rbiomass)
```

## Biomass estimations

The biomass functions (`TreeBiomass` and `SummaryBiomass`) use Forest
Inventory and Analysis (FIA) Regional Biomass Equations to estimate
above-ground stem, bark, and branch tree biomass. The functions use the
California equation set and should not be used for data from other
regions.

### :eight_spoked_asterisk: `TreeBiomass ( )`

### Inputs

1.  `data` A dataframe or tibble. Each row must be an observation of an
    individual tree.

2.  `status` Must be a variable (column) in the provided dataframe or
    tibble. Specifies whether the individual tree is alive (1) or dead
    (0). The class of this variable will be coerced to factor.

3.  `species` Must be a variable (column) in the provided dataframe or
    tibble. Specifies the species of the individual tree. Must follow
    four-letter species code or FIA naming conventions (see species code
    tables below). The class of this variable will be coerced to
    character.

4.  `dbh` Must be a **numeric** variable (column) in the provided
    dataframe or tibble. Provides the diameter at breast height (DBH) of
    the individual tree in either centimeters or inches.

5.  `ht` Must be a **numeric** variable (column) in the provided
    dataframe or tibble. Provides the height of the individual tree in
    either meters or feet.

6.  `sp_codes` Not a variable (column) in the provided dataframe or
    tibble. Specifies whether the species variable follows the
    four-letter code or FIA naming convention (see species code tables
    below). Must be set to either “4letter” or “fia”. The default is set
    to “4letter”.

7.  `units` Not a variable (column) in the provided dataframe or tibble.
    Specifies whether the dbh and ht variables were measured using
    metric (centimeters and meters) or imperial (inches and feet) units.
    Also specifies whether the results will be given in metric
    (kilograms) or imperial (US tons) units. Must be set to either
    “metric” or “imperial”. The default is set to “metric”.

### Outputs

The original dataframe will be returned, with four new columns:

1.  `stem_bio_kg` (or `stem_bio_tons`): biomass of stem in kilograms (or
    US tons)

2.  `bark_bio_kg` (or `bark_bio_tons`): biomass of bark in kilograms (or
    US tons)

3.  `branch_bio_kg` (or `branch_bio_tons`): biomass of branches in
    kilograms (or US tons)

4.  `total_bio_kg` (or `total_bio_kg`): biomass of tree (stem + bark +
    branches) in kilograms (or US tons)

*Important note: For some hardwood species, the `stem_bio` includes bark
and branch biomass. In these cases, bark and branch biomass are not
available as separate components of total biomass. `bark_bio` and
`branch_bio` will appear as `NA` and the `total_bio` will be equivalent
to the `stem_bio`.*

### Demonstration

``` r
# investigate input dataframe
demo_data
```

    ##   Forest Plot_id SPH Live  SPP DBH_CM HT_M
    ## 1   SEKI       1  50    1 PSME   10.3  5.1
    ## 2   SEKI       1  50    0 ABCO   44.7 26.4
    ## 3   SEKI       2  50    1 PSME   19.1  8.0
    ## 4   SEKI       2  50    1 PSME   32.8 23.3
    ## 5   YOMI       1  50    1 ABCO   13.8 11.1
    ## 6   YOMI       1  50    1 CADE   20.2  8.5
    ## 7   YOMI       2  50    1 QUKE   31.7 22.3
    ## 8   YOMI       2  50    0 ABCO   13.1  9.7
    ## 9   YOMI       2  50    0 PSME   15.8 10.6

``` r
# call the TreeBiomass() function in the Rbiomass package
tree_bio_demo <- TreeBiomass(data = demo_data,
                             status = "Live",
                             species = "SPP",
                             dbh = "DBH_CM",
                             ht = "HT_M",
                             sp_codes = "4letter",
                             units = "metric")

tree_bio_demo
```

    ##   Forest Plot_id SPH Live  SPP DBH_CM HT_M stem_bio_kg bark_bio_kg
    ## 1   SEKI       1  50    1 PSME   10.3  5.1       20.08        3.88
    ## 2   SEKI       1  50    0 ABCO   44.7 26.4      535.66      260.36
    ## 3   SEKI       2  50    1 PSME   19.1  8.0       40.52       17.42
    ## 4   SEKI       2  50    1 PSME   32.8 23.3      347.02       64.81
    ## 5   YOMI       1  50    1 ABCO   13.8 11.1       32.46       10.56
    ## 6   YOMI       1  50    1 CADE   20.2  8.5       42.34        8.91
    ## 7   YOMI       2  50    1 QUKE   31.7 22.3      572.06          NA
    ## 8   YOMI       2  50    0 ABCO   13.1  9.7       30.05        9.16
    ## 9   YOMI       2  50    0 PSME   15.8 10.6       48.34       10.98
    ##   branch_bio_kg total_bio_kg
    ## 1          3.64        27.60
    ## 2         78.41       874.43
    ## 3         13.64        71.58
    ## 4         43.34       455.17
    ## 5         15.62        58.64
    ## 6         13.41        64.66
    ## 7            NA       572.06
    ## 8         15.06        54.27
    ## 9          9.09        68.41

**Notice in the output dataframe:**

- QUKE (California black oak) has `NA` `bark_bio_kg` and
  `branch_bio_kg`. For some hardwood species, the `stem_bio_kg` includes
  bark and branch biomass. In these cases, bark and branch biomass are
  not available as separate components of total biomass.

- The column names of the input dataframe will remain intact in the
  output dataframe.

- The `Forest`, `Plot_id`, and `SPH` columns, which are not directly
  used in the biomass calculations, remain in the output dataframe. Any
  additional columns in the input dataframe will remain in the output
  dataframe.

<br>

### :eight_spoked_asterisk: `SummaryBiomass( )`

### Inputs

1.  `data` A dataframe or tibble. Each row must be an observation of an
    individual tree.

2.  `site` Must be a variable (column) in the provided dataframe or
    tibble. Describes the broader location or forest where the data were
    collected. The class of this variable will be coerced to character.

3.  `plot` Must be a variable (column) in the provided dataframe or
    tibble. Identifies the plot in which the individual tree was
    measured. The class of this variable will be coerced to character.

4.  `exp_factor` Must be a numeric variable (column) in the provided
    dataframe or tibble. The expansion factor specifies the number of
    trees per hectare (or per acre) that a given plot tree represents.

5.  `status` Must be a variable (column) in the provided dataframe or
    tibble. Specifies whether the individual tree is alive (1) or dead
    (0). The class of this variable will be coerced to factor.

6.  `species` Must be a variable (column) in the provided dataframe or
    tibble. Specifies the species of the individual tree. Must follow
    four-letter species code or FIA naming conventions (see species code
    tables below). The class of this variable will be coerced to
    character.

7.  `dbh` Must be a **numeric** variable (column) in the provided
    dataframe or tibble. Provides the diameter at breast height (DBH) of
    the individual tree in either centimeters or inches.

8.  `ht` Must be a **numeric** variable (column) in the provided
    dataframe or tibble. Provides the height of the individual tree in
    either meters or feet.

9.  `sp_codes` Not a variable (column) in the provided dataframe or
    tibble. Specifies whether the species variable follows the
    four-letter code or FIA naming convention (see species code tables
    below). Must be set to either “4letter” or “fia”. The default is set
    to “4letter”.

10. `units` Not a variable (column) in the provided dataframe or tibble.
    Specifies (1) whether the dbh and ht variables were measured using
    metric (centimeters and meters) or imperial (inches and feet)
    units; (2) whether the expansion factor is in metric (stems per
    hectare) or imperial (stems per acre) units; and (3) whether results
    will be given in metric (megagrams per hectare) or imperial (US tons
    per acre) units. Must be set to either “metric” or “imperial”. The
    default is set to “metric”.

11. `results` Not a variable (column) in the provided dataframe or
    tibble. Specifies whether the results will be summarized by plot or
    by plot as well as species. Must be set to either “by_plot” or
    “by_species.” The default is set to “by_plot”.

### Outputs

A dataframe with the following columns:

1.  `site`: as described above

2.  `plot`: as described above

3.  `species`: if results argument was set to “by_species”

4.  `live_Mg_ha` (or `live_ton_ac`): above-ground live tree biomass in
    megagrams per hectare (or US tons per acre)

5.  `dead_Mg_ha` (or `dead_ton_ac`): above-ground dead tree biomass in
    megagrams per hectare (or US tons per acre)

### Demonstrations

**Results summarized by plot:**

``` r
# investigate input dataframe
demo_data
```

    ##   Forest Plot_id SPH Live  SPP DBH_CM HT_M
    ## 1   SEKI       1  50    1 PSME   10.3  5.1
    ## 2   SEKI       1  50    0 ABCO   44.7 26.4
    ## 3   SEKI       2  50    1 PSME   19.1  8.0
    ## 4   SEKI       2  50    1 PSME   32.8 23.3
    ## 5   YOMI       1  50    1 ABCO   13.8 11.1
    ## 6   YOMI       1  50    1 CADE   20.2  8.5
    ## 7   YOMI       2  50    1 QUKE   31.7 22.3
    ## 8   YOMI       2  50    0 ABCO   13.1  9.7
    ## 9   YOMI       2  50    0 PSME   15.8 10.6

``` r
# call the SummaryBiomass() function in the Rbiomass package
# keep default sp_codes and units
sum_bio_demo1 <- SummaryBiomass(data = demo_data,
                                site = "Forest",
                                plot = "Plot_id",
                                exp_factor = "SPH",
                                status = "Live",
                                species = "SPP",
                                dbh = "DBH_CM",
                                ht = "HT_M",
                                results = "by_plot")

sum_bio_demo1
```

    ##   site plot live_Mg_ha dead_Mg_ha
    ## 1 SEKI    1       1.38      43.72
    ## 2 SEKI    2      26.34       0.00
    ## 3 YOMI    1       6.16       0.00
    ## 4 YOMI    2      28.60       6.13

<br>

**Results summarized by plot as well as by species:**

``` r
# call the SummaryBiomass() function in the Rbiomass package
# keep default sp_codes and units
sum_bio_demo2 <- SummaryBiomass(data = demo_data,
                                site = "Forest",
                                plot = "Plot_id",
                                exp_factor = "SPH",
                                status = "Live",
                                species = "SPP",
                                dbh = "DBH_CM",
                                ht = "HT_M",
                                results = "by_species")

sum_bio_demo2
```

    ##    site plot species live_Mg_ha dead_Mg_ha
    ## 1  SEKI    1    PSME       1.38       0.00
    ## 2  SEKI    1    ABCO       0.00      43.72
    ## 3  SEKI    1    CADE       0.00       0.00
    ## 4  SEKI    1    QUKE       0.00       0.00
    ## 5  SEKI    2    PSME      26.34       0.00
    ## 6  SEKI    2    ABCO       0.00       0.00
    ## 7  SEKI    2    CADE       0.00       0.00
    ## 8  SEKI    2    QUKE       0.00       0.00
    ## 9  YOMI    1    PSME       0.00       0.00
    ## 10 YOMI    1    ABCO       2.93       0.00
    ## 11 YOMI    1    CADE       3.23       0.00
    ## 12 YOMI    1    QUKE       0.00       0.00
    ## 13 YOMI    2    PSME       0.00       3.42
    ## 14 YOMI    2    ABCO       0.00       2.71
    ## 15 YOMI    2    CADE       0.00       0.00
    ## 16 YOMI    2    QUKE      28.60       0.00

<br>

## Forest composition and structure compilations

The forest composition and structure functions (`TreeBiomass` and
`SummaryBiomass`) assist with common plot-level data compilations. These
functions help ensure that best practices in data compilation are
observed.

## Background information

### Species code tables

**Softwoods**

| common name        | scientific name           | 4-letter code | FIA code |
|:-------------------|:--------------------------|:--------------|:---------|
| White fir          | Abies concolor            | ABCO          | 15       |
| Grand fir          | Abies grandis             | ABGR          | 17       |
| California red fir | Abies magnifica           | ABMA          | 20       |
| Noble fir          | Abies procera             | ABPR          | 22       |
| Western juniper    | Juniperus occidentalis    | JUOC          | 64       |
| Incense cedar      | Calocedrus decurrens      | CADE          | 81       |
| Lodgepole pine     | Pinus contorta            | PICO          | 108      |
| Jeffrey pine       | Pinus jeffreyi            | PIJE          | 116      |
| Sugar pine         | Pinus lambertinana        | PILA          | 117      |
| Western white pine | Pinus monticola           | PIMO          | 119      |
| Ponderosa pine     | Pinus ponderosa           | PIPO          | 122      |
| Foothill pine      | Pinus sabiniana           | PISA          | 127      |
| Douglas-fir        | Pseudotsuga menziesii     | PSME          | 202      |
| Redwood            | Sequoioideae sempervirens | SESE          | 211      |
| Giant sequoia      | Sequoiadendron giganteum  | SEGI          | 212      |
| Pacific yew        | Taxus brevifolia          | TABR          | 231      |
| California nutmeg  | Torreya californica       | TOCA          | 251      |
| Western hemlock    | Tsuga heterophylla        | TSHE          | 263      |
| Mountain hemlock   | Tsuga mertensiana         | TSME          | 264      |
| Unknown conifer    | NA                        | UNCO          | 298      |

<br>

**Hardwoods**

| common name          | scientific name              | 4-letter code | FIA code |
|:---------------------|:-----------------------------|:--------------|:---------|
| Bigleaf maple        | Acer macrophyllum            | ACMA          | 312      |
| White alder          | Alnus rhombifolia            | ALRH          | 352      |
| Pacific madrone      | Arbutus menziesii            | ARME          | 361      |
| Golden chinkapin     | Chrysolepis chrysophylla     | CHCH          | 431      |
| Pacific dogwood      | Cornus nuttallii             | CONU          | 492      |
| Tanoak               | Notholithocarpus densiflorus | NODE          | 631      |
| Quaking aspen        | Populus tremuloides          | POTR          | 746      |
| California live oak  | Quercus agrifolia            | QUAG          | 801      |
| Canyon live oak      | Quercus chrysolepis          | QUCH          | 805      |
| California black oak | Quercus kelloggii            | QUKE          | 818      |
| Willow species       | Salix spp.                   | SASP          | 920      |
| California-laurel    | Umbellularia californica     | UMCA          | 981      |
| Unknown hardwood     | NA                           | UNHA          | 998      |
| Unknown tree         | NA                           | UNTR          | 999      |

*Note: Four-letter species codes are the first two letters of the genus
followed by the first two letters of the species.*

## References

1.  *Volume Estimation for the PNW-FIA Integrated Database.* U.S.
    Department of Agriculture, Forest Service, Pacific Northwest
    Research Station. [Link to
    PDF](https://ww2.arb.ca.gov/sites/default/files/cap-and-trade/protocols/usforest/2014/volume_equations.pdf)

2.  *Regional Biomass Equations Used by FIA to Estimate Bole, Bark, and
    Branches.* U.S. Department of Agriculture, Forest Service, Pacific
    Northwest Research Station. [Link to
    PDF](https://ww2.arb.ca.gov/sites/default/files/cap-and-trade/protocols/usforest/2014/biomass_equations.pdf)


# Rbiomass

The `Rbiomass` package uses Forest Inventory and Analysis (FIA) Regional
Biomass Equations to estimate above-ground stem, bark, and branch tree
biomass. The package uses the California equation set and should not be
used for data from other regions.

## Installation instructions

To install the `Rbiomass` package from GitHub:

``` r
# install and load devtools
install.packages("devtools")
library(devtools)

# install and load Rbiomass
devtools::install_github('kearutherford/Rbiomass')
library(Rbiomass)
```

## Using Rbiomass

The top-level function in the `Rbiomass` package is `TreeBiomass()`,
which takes the following inputs:

### Inputs

1.  `data` A dataframe or tibble. Each row must be an observation of an
    individual tree.

2.  `site` Must be a variable (column) in the provided dataframe or
    tibble. Decscribes the broader location or forest where the data
    were collected. The class of this variable will be coerced to
    character.

3.  `plot` Must be a variable (column) in the provided dataframe or
    tibble. Identifies the plot in which the individual tree was
    measured. The class of this variable will be coerced to character.

4.  `species` Must be a variable (column) in the provided dataframe or
    tibble. Specifies the species of the individual tree. Must follow
    four-letter species code or FIA naming conventions (see species code
    tables below). The class of this variable will be coerced to
    character.

5.  `dbh` Must be a **numeric** variable (column) in the provided
    dataframe or tibble. Provides the diameter at breast height (DBH) of
    the individual tree in either centimeters or inches.

6.  `ht` Must be a **numeric** variable (column) in the provided
    dataframe or tibble. Provides the height of the individual tree in
    either meters or feet.

7.  `sp_codes` Not a variable (column) in the provided dataframe or
    tibble. Specifies whether the species variable follows the
    four-letter code or FIA naming convention (see species code tables
    below). Must be set to either “4letter” or “fia”. The default is set
    to “4letter”.

8.  `units` Not a variable (column) in the provided dataframe or tibble.
    Specifies whether the dbh and ht variables were measured using
    metric (centimeters and meters) or imperial (inches and feet) units.
    Must be set to either “metric” or “imperial”. The default is set to
    “metric”.

### Outputs

The original dataframe will be returned, with four new columns:

1.  `stem_bio_kg` biomass of stem (or bole) in kilograms

2.  `bark_bio_kg` biomass of bark in kilograms

3.  `branch_bio_kg` biomass of branches in kilograms

4.  `total_bio_kg` biomass of tree (stem + bark + branches) in kilograms

*Important note: For some hardwood species, the `stem_bio_kg` includes
bark and branch biomass. In these cases, bark and branch biomass are not
available as separate components of total biomass. `bark_bio_kg` and
`branch_bio_kg` will appear as `NA` and the `total_bio_kg` will be
equivalent to the `stem_bio_kg`.*

## Demonstration

``` r
# investigate input dataframe
demo_data
```

``` r
# call the TreeBiomass() function in the Rbiomass package
tree_bio_demo <- TreeBiomass(data = demo_data,
                             site = "Forest",
                             plot = "Plot_id",
                             species = "SPP",
                             dbh = "DBH_CM",
                             ht = "HT_M",
                             sp_codes = "4letter",
                             units = "metric")

tree_bio_demo
```

### Notice in the output dataframe:

-   QUKE (California black oak) has `NA` `bark_bio_kg` and
    `branch_bio_kg`. For some hardwood species, the `stem_bio_kg`
    includes bark and branch biomass. In these cases, bark and branch
    biomass are not available as separate components of total biomass.

-   The column names of the input dataframe will remain intact in the
    output dataframe.

-   The `status` column, which is not directly used in the biomass
    calculations, remains in the output dataframe. Any additional
    columns in the input dataframe will remain in the output dataframe.

## Species code tables

### Softwoods :evergreen_tree:

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

### Hardwoods :deciduous_tree:

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

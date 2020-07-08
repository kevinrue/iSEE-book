# Panel generics {#api}



## Overview

This chapter lists of all generics provided by *[iSEE](https://bioconductor.org/packages/3.11/iSEE)* to implement class-specific behaviors.
For each generic, we will show its signature and all available methods implemented for subclasses.
Do not be intimidated; it is rare that it is necessary to define methods for all of the generics shown here.
If your class inherits from an existing `Panel` subclass, many of these methods will be implemented for free, and all you have to do is to override a handful of methods to achieve the desired customization.
We recommend skimming over this chapter on the first read to get a feel for the available entry points into the `Panel` API.
Once you have a better idea of what your class needs to do, you can obtain exhaustive documentation about each generic in the usual way, e.g., `?.defineInterface`.

## Parameter set-up

[`.cacheCommonInfo()`](https://isee.github.io/iSEE/reference/setup-generics.html) caches common values to be used for all instances of a particular panel class.
These cached values can be used to, e.g., populate the UI or set up constants to be used in the panel's output. 
This avoids potentially costly re-calculations throughout the lifetime of the `iSEE()` application.


```r
getGeneric(".cacheCommonInfo")
```

```
## standardGeneric for ".cacheCommonInfo" defined from package "iSEE"
## 
## function (x, se) 
## standardGeneric(".cacheCommonInfo")
## <bytecode: 0x7f9c9e077530>
## <environment: 0x7f9c9e096ff0>
## Methods may be defined for arguments: x, se
## Use  showMethods(".cacheCommonInfo")  for currently available ones.
```

```r
showMethods(".cacheCommonInfo")
```

```
## Function: .cacheCommonInfo (package iSEE)
## x="ColumnDataTable"
## x="ColumnDotPlot"
## x="ComplexHeatmapPlot"
## x="DotPlot"
## x="Panel"
## x="ReducedDimensionPlot"
## x="RowDataTable"
## x="RowDotPlot"
```

[`.refineParameters()`](https://isee.github.io/iSEE/reference/setup-generics.html) edits the parameters of a panel to ensure that they are valid.
For example, we may need to restrict the choices of a selectize element to some pre-defined possibilities.
This is run for each panel during the `iSEE()` application set-up to validate the user-supplied panel configuration.


```r
getGeneric(".refineParameters")
```

```
## standardGeneric for ".refineParameters" defined from package "iSEE"
## 
## function (x, se) 
## standardGeneric(".refineParameters")
## <bytecode: 0x7f9c9e017a88>
## <environment: 0x7f9c9c5d6808>
## Methods may be defined for arguments: x, se
## Use  showMethods(".refineParameters")  for currently available ones.
```

```r
showMethods(".refineParameters")
```

```
## Function: .refineParameters (package iSEE)
## x="ColumnDataPlot"
## x="ColumnDataTable"
## x="ColumnDotPlot"
## x="ColumnTable"
## x="ComplexHeatmapPlot"
## x="DotPlot"
## x="FeatureAssayPlot"
## x="Panel"
## x="ReducedDimensionPlot"
## x="RowDataPlot"
## x="RowDataTable"
## x="RowDotPlot"
## x="RowTable"
## x="SampleAssayPlot"
```

## Defining the user interface

### In general

[`.defineInterface()`](https://isee.github.io/iSEE/reference/interface-generics.html) defines the user interface (UI) for a panel, defining all HTML widgets required to modify parameters.
Parameters should be bundled into collapsible boxes according to their approximate purpose.
This generic provides the most general mechanism for controlling the panel's interface.


```r
getGeneric(".defineInterface")
```

```
## standardGeneric for ".defineInterface" defined from package "iSEE"
## 
## function (x, se, select_info) 
## standardGeneric(".defineInterface")
## <bytecode: 0x7f9c9eb79f48>
## <environment: 0x7f9c9eb89590>
## Methods may be defined for arguments: x, se, select_info
## Use  showMethods(".defineInterface")  for currently available ones.
```

```r
showMethods(".defineInterface")
```

```
## Function: .defineInterface (package iSEE)
## x="ColumnDotPlot"
## x="ComplexHeatmapPlot"
## x="Panel"
## x="RowDotPlot"
```

[`.defineDataInterface()`](https://isee.github.io/iSEE/reference/interface-generics.html) defines the UI for modifying all data-related parameters in a given panel.
Such parameters are fundamental to the interpretation of the panel's output, as opposed to their aesthetic counterparts.
This generic allows developers to fine-tune the data UI for subclasses without reimplementing the parent class' `.defineInterface()`, especially if we wish to re-use the parent's UI for aesthetic parameters.


```r
getGeneric(".defineDataInterface")
```

```
## standardGeneric for ".defineDataInterface" defined from package "iSEE"
## 
## function (x, se, select_info) 
## standardGeneric(".defineDataInterface")
## <bytecode: 0x7f9c9ebd3430>
## <environment: 0x7f9c9ec09c18>
## Methods may be defined for arguments: x, se, select_info
## Use  showMethods(".defineDataInterface")  for currently available ones.
```

```r
showMethods(".defineDataInterface")
```

```
## Function: .defineDataInterface (package iSEE)
## x="ColumnDataPlot"
## x="ComplexHeatmapPlot"
## x="FeatureAssayPlot"
## x="Panel"
## x="ReducedDimensionPlot"
## x="RowDataPlot"
## x="SampleAssayPlot"
```

[`.hideInterface()`](https://isee.github.io/iSEE/reference/interface-generics.html) determines whether certain UI elements should be hidden from the user.
This allows subclasses to hide easily inappropriate or irrelevant parts of the parent's UI without redefining `.defineInterface()`.
For example, we can remove row selection UI elements for panels that only accept column selections.


```r
getGeneric(".hideInterface")
```

```
## standardGeneric for ".hideInterface" defined from package "iSEE"
## 
## function (x, field) 
## standardGeneric(".hideInterface")
## <bytecode: 0x7f9c9c75d5a8>
## <environment: 0x7f9c9c771ea0>
## Methods may be defined for arguments: x, field
## Use  showMethods(".hideInterface")  for currently available ones.
```

```r
showMethods(".hideInterface")
```

```
## Function: .hideInterface (package iSEE)
## x="ColumnDataTable"
## x="ColumnDotPlot"
## x="ColumnTable"
## x="ComplexHeatmapPlot"
## x="Panel"
## x="RowDataTable"
## x="RowDotPlot"
## x="RowTable"
## x="Table"
```

### The `DotPlot` visual interface

[`.defineVisualColorInterface()`](https://isee.github.io/iSEE/reference/visual-parameters-generics.html) defines the UI for color-related visual parameters in a `DotPlot` subclass.


```r
getGeneric(".defineVisualColorInterface")
```

```
## standardGeneric for ".defineVisualColorInterface" defined from package "iSEE"
## 
## function (x, se, select_info) 
## standardGeneric(".defineVisualColorInterface")
## <bytecode: 0x7f9c9eb0cd88>
## <environment: 0x7f9c9eb22c40>
## Methods may be defined for arguments: x, se, select_info
## Use  showMethods(".defineVisualColorInterface")  for currently available ones.
```

```r
showMethods(".defineVisualColorInterface")
```

```
## Function: .defineVisualColorInterface (package iSEE)
## x="ColumnDotPlot"
## x="RowDotPlot"
```

[`.defineVisualFacetInterface()`](https://isee.github.io/iSEE/reference/visual-parameters-generics.html) defines the UI for facet-related visual parameters in a `DotPlot` subclass.


```r
getGeneric(".defineVisualFacetInterface")
```

```
## standardGeneric for ".defineVisualFacetInterface" defined from package "iSEE"
## 
## function (x, se) 
## standardGeneric(".defineVisualFacetInterface")
## <bytecode: 0x7f9c9eaca790>
## <environment: 0x7f9c9ead61c8>
## Methods may be defined for arguments: x, se
## Use  showMethods(".defineVisualFacetInterface")  for currently available ones.
```

```r
showMethods(".defineVisualFacetInterface")
```

```
## Function: .defineVisualFacetInterface (package iSEE)
## x="ColumnDotPlot"
## x="RowDotPlot"
```

[`.defineVisualShapeInterface()`](https://isee.github.io/iSEE/reference/visual-parameters-generics.html) defines the UI for shape-related visual parameters in a `DotPlot` subclass.


```r
getGeneric(".defineVisualShapeInterface")
```

```
## standardGeneric for ".defineVisualShapeInterface" defined from package "iSEE"
## 
## function (x, se) 
## standardGeneric(".defineVisualShapeInterface")
## <bytecode: 0x7f9c9ea60850>
## <environment: 0x7f9c9ea69740>
## Methods may be defined for arguments: x, se
## Use  showMethods(".defineVisualShapeInterface")  for currently available ones.
```

```r
showMethods(".defineVisualShapeInterface")
```

```
## Function: .defineVisualShapeInterface (package iSEE)
## x="ColumnDotPlot"
## x="RowDotPlot"
```

[`.defineVisualSizeInterface()`](https://isee.github.io/iSEE/reference/visual-parameters-generics.html) defines the UI for size-related visual parameters in a `DotPlot` subclass.


```r
getGeneric(".defineVisualSizeInterface")
```

```
## standardGeneric for ".defineVisualSizeInterface" defined from package "iSEE"
## 
## function (x, se) 
## standardGeneric(".defineVisualSizeInterface")
## <bytecode: 0x7f9c9ea25860>
## <environment: 0x7f9c9ea36f58>
## Methods may be defined for arguments: x, se
## Use  showMethods(".defineVisualSizeInterface")  for currently available ones.
```

```r
showMethods(".defineVisualSizeInterface")
```

```
## Function: .defineVisualSizeInterface (package iSEE)
## x="ColumnDotPlot"
## x="RowDotPlot"
```

[`.defineVisualTextInterface()`](https://isee.github.io/iSEE/reference/visual-parameters-generics.html) defines the UI for text-related visual parameters in a `DotPlot` subclass.


```r
getGeneric(".defineVisualTextInterface")
```

```
## standardGeneric for ".defineVisualTextInterface" defined from package "iSEE"
## 
## function (x, se) 
## standardGeneric(".defineVisualTextInterface")
## <bytecode: 0x7f9c9e9eb290>
## <environment: 0x7f9c9ea06c10>
## Methods may be defined for arguments: x, se
## Use  showMethods(".defineVisualTextInterface")  for currently available ones.
```

```r
showMethods(".defineVisualTextInterface")
```

```
## Function: .defineVisualTextInterface (package iSEE)
## x="DotPlot"
```

[`.defineVisualOtherInterface()`](https://isee.github.io/iSEE/reference/visual-parameters-generics.html) defines the UI for other visual parameters in a `DotPlot` subclass.


```r
getGeneric(".defineVisualOtherInterface")
```

```
## standardGeneric for ".defineVisualOtherInterface" defined from package "iSEE"
## 
## function (x) 
## standardGeneric(".defineVisualOtherInterface")
## <bytecode: 0x7f9c9eaac8f0>
## <environment: 0x7f9c9eab0420>
## Methods may be defined for arguments: x
## Use  showMethods(".defineVisualOtherInterface")  for currently available ones.
```

```r
showMethods(".defineVisualOtherInterface")
```

```
## Function: .defineVisualOtherInterface (package iSEE)
## x="DotPlot"
```

These generics allow developers to change UI elements for a subclass without completely reimplementing `.defineInterface()`.
Of course, if we have already specialized `.defineInterface()`, then there's no need to define methods for these generics.

## Creating observers

[`.createObservers()`](https://isee.github.io/iSEE/reference/observer-generics.html) sets up Shiny observers for the current session.
This is the workhorse function to ensure that the panel actually responds to user input.
Developers can define arbitrarily complex observer logic here as long as it is self-contained within a single panel.
(Interactive mechanics that involve communication between panels is handled elsewhere.)


```r
getGeneric(".createObservers")
```

```
## nonstandardGenericFunction for ".createObservers" defined from package "iSEE"
## 
## function (x, se, input, session, pObjects, rObjects) 
## {
##     standardGeneric(".createObservers")
## }
## <bytecode: 0x7f9c9ec75bf8>
## <environment: 0x7f9c9ecb6450>
## Methods may be defined for arguments: x, se, input, session, pObjects, rObjects
## Use  showMethods(".createObservers")  for currently available ones.
```

```r
showMethods(".createObservers")
```

```
## Function: .createObservers (package iSEE)
## x="ColumnDataPlot"
## x="ColumnDotPlot"
## x="ColumnTable"
## x="ComplexHeatmapPlot"
## x="DotPlot"
## x="FeatureAssayPlot"
## x="Panel"
## x="ReducedDimensionPlot"
## x="RowDataPlot"
## x="RowDotPlot"
## x="RowTable"
## x="SampleAssayPlot"
## x="Table"
```

## Defining panel outputs

### In general

[`.defineOutput()`](https://isee.github.io/iSEE/reference/output-generics.html) defines the interface element containing the visual output of the panel.
Examples include `plotOutput()` for plots or `dataTableOutput()` for tables.
Note that this generic only defines the output in the `iSEE()` interface; it does not control the rendering.


```r
getGeneric(".defineOutput")
```

```
## nonstandardGenericFunction for ".defineOutput" defined from package "iSEE"
## 
## function (x, ...) 
## {
##     standardGeneric(".defineOutput")
## }
## <bytecode: 0x7f9c9eb4cb50>
## <environment: 0x7f9c9eb575d0>
## Methods may be defined for arguments: x
## Use  showMethods(".defineOutput")  for currently available ones.
```

```r
showMethods(".defineOutput")
```

```
## Function: .defineOutput (package iSEE)
## x="ComplexHeatmapPlot"
## x="DotPlot"
## x="Table"
```

[`.renderOutput()`](https://isee.github.io/iSEE/reference/output-generics.html) assigns a reactive expression to populate the output interface element with content.
This is usually as simple as calling functions like `renderPlotOutput()` with an appropriate rendering expression containing a call to `.retrieveOutput()`.


```r
getGeneric(".renderOutput")
```

```
## nonstandardGenericFunction for ".renderOutput" defined from package "iSEE"
## 
## function (x, se, ..., output, pObjects, rObjects) 
## {
##     standardGeneric(".renderOutput")
## }
## <bytecode: 0x7f9c9df91110>
## <environment: 0x7f9c9dfa84c0>
## Methods may be defined for arguments: x, se, output, pObjects, rObjects
## Use  showMethods(".renderOutput")  for currently available ones.
```

```r
showMethods(".renderOutput")
```

```
## Function: .renderOutput (package iSEE)
## x="ComplexHeatmapPlot"
## x="DotPlot"
## x="Panel"
## x="Table"
```

[`.generateOutput()`](https://isee.github.io/iSEE/reference/output-generics.html) actually generates the panel output, be it a plot or table or something more exotic.
This is usually the real function that does all the work, being called by `.retrieveOutput()` prior to rendering the output. 
Some effort is required here to ensure that the commands used to generate the output are also captured.


```r
getGeneric(".generateOutput")
```

```
## nonstandardGenericFunction for ".generateOutput" defined from package "iSEE"
## 
## function (x, se, ..., all_memory, all_contents) 
## {
##     standardGeneric(".generateOutput")
## }
## <bytecode: 0x7f9c9c7d1870>
## <environment: 0x7f9c9e811c98>
## Methods may be defined for arguments: x, se, all_memory, all_contents
## Use  showMethods(".generateOutput")  for currently available ones.
```

```r
showMethods(".generateOutput")
```

```
## Function: .generateOutput (package iSEE)
## x="ComplexHeatmapPlot"
## x="DotPlot"
## x="Table"
```

[`.exportOutput()`](https://isee.github.io/iSEE/reference/output-generics.html) converts the panel output into a form that is downloadable, such as a PDF file for plots or CSVs for tables. 
This is called whenever the user requests a download of the panel outputs.


```r
getGeneric(".exportOutput")
```

```
## nonstandardGenericFunction for ".exportOutput" defined from package "iSEE"
## 
## function (x, se, all_memory, all_contents) 
## {
##     standardGeneric(".exportOutput")
## }
## <bytecode: 0x7f9c9e9c44a8>
## <environment: 0x7f9c9e9e5c68>
## Methods may be defined for arguments: x, se, all_memory, all_contents
## Use  showMethods(".exportOutput")  for currently available ones.
```

```r
showMethods(".exportOutput")
```

```
## Function: .exportOutput (package iSEE)
## x="DotPlot"
## x="Panel"
## x="Table"
```

### For `DotPlot`s

[`.generateDotPlot()`](https://isee.github.io/iSEE/reference/plot-generics.html) creates the `ggplot` object for `DotPlot` subclasses.
This is called internally by the `DotPlot` method for `.generateOutput()` to create the relevant output.
Developers of `DotPlot` subclasses can specialize this generic to avoid having to reimplement `.generateOutput()` (and the associated data management therein).


```r
getGeneric(".generateDotPlot")
```

```
## standardGeneric for ".generateDotPlot" defined from package "iSEE"
## 
## function (x, labels, envir) 
## standardGeneric(".generateDotPlot")
## <bytecode: 0x7f9c9e88c728>
## <environment: 0x7f9c9e8cfba0>
## Methods may be defined for arguments: x, labels, envir
## Use  showMethods(".generateDotPlot")  for currently available ones.
```

```r
showMethods(".generateDotPlot")
```

```
## Function: .generateDotPlot (package iSEE)
## x="DotPlot"
```

[`.generateDotPlotData()`](https://isee.github.io/iSEE/reference/plot-generics.html) creates the `data.frame` that is used by `.generateDotPlot()`.
This allows developers to change the data setup for a `DotPlot` subclass without having to even specialize `.generateDotPlot()`, provided they are happy with the default `DotPlot` aesthetics.


```r
getGeneric(".generateDotPlotData")
```

```
## standardGeneric for ".generateDotPlotData" defined from package "iSEE"
## 
## function (x, envir) 
## standardGeneric(".generateDotPlotData")
## <bytecode: 0x7f9c9e84a288>
## <environment: 0x7f9c9e871f08>
## Methods may be defined for arguments: x, envir
## Use  showMethods(".generateDotPlotData")  for currently available ones.
```

```r
showMethods(".generateDotPlotData")
```

```
## Function: .generateDotPlotData (package iSEE)
## x="ColumnDataPlot"
## x="FeatureAssayPlot"
## x="ReducedDimensionPlot"
## x="RowDataPlot"
## x="SampleAssayPlot"
```

[`.prioritizeDotPlotData()`](https://isee.github.io/iSEE/reference/plot-generics.html) determines how points should be prioritized during overplotting.
This usually doesn't need to be specialized.


```r
getGeneric(".prioritizeDotPlotData")
```

```
## standardGeneric for ".prioritizeDotPlotData" defined from package "iSEE"
## 
## function (x, envir) 
## standardGeneric(".prioritizeDotPlotData")
## <bytecode: 0x7f9c9c5ecea8>
## <environment: 0x7f9c9c5f1e10>
## Methods may be defined for arguments: x, envir
## Use  showMethods(".prioritizeDotPlotData")  for currently available ones.
```

```r
showMethods(".prioritizeDotPlotData")
```

```
## Function: .prioritizeDotPlotData (package iSEE)
## x="DotPlot"
```

[`.colorByNoneDotPlotField()`](https://isee.github.io/iSEE/reference/plot-generics.html) and [`.colorByNoneDotPlotScale()`](https://isee.github.io/iSEE/reference/plot-generics.html) define the default color scale when `ColorBy="None"`.
This usually doesn't need to be specialized.


```r
getGeneric(".colorByNoneDotPlotField")
```

```
## standardGeneric for ".colorByNoneDotPlotField" defined from package "iSEE"
## 
## function (x) 
## standardGeneric(".colorByNoneDotPlotField")
## <bytecode: 0x7f9c9ed1f260>
## <environment: 0x7f9c9ed22e70>
## Methods may be defined for arguments: x
## Use  showMethods(".colorByNoneDotPlotField")  for currently available ones.
```

```r
showMethods(".colorByNoneDotPlotField")
```

```
## Function: .colorByNoneDotPlotField (package iSEE)
## x="DotPlot"
```

```r
getGeneric(".colorByNoneDotPlotScale")
```

```
## standardGeneric for ".colorByNoneDotPlotScale" defined from package "iSEE"
## 
## function (x) 
## standardGeneric(".colorByNoneDotPlotScale")
## <bytecode: 0x7f9c9ed06920>
## <environment: 0x7f9c9ed0a258>
## Methods may be defined for arguments: x
## Use  showMethods(".colorByNoneDotPlotScale")  for currently available ones.
```

```r
showMethods(".colorByNoneDotPlotScale")
```

```
## Function: .colorByNoneDotPlotScale (package iSEE)
## x="DotPlot"
```

### For metadata `DotPlot`s

[`.allowableYAxisChoices()`](https://isee.github.io/iSEE/reference/metadata-plot-generics.html) and [`.allowableXAxisChoices()`](https://isee.github.io/iSEE/reference/metadata-plot-generics.html) specifies the acceptable fields to put on the x- or y-axes of `ColumnDataPlot` or `RowDataPlot` subclasses.
This is typically used to constrain the choices for customized panels that only accept certain column names or types.
For example, a hypothetical MA plot panel would only accept log-fold changes on the y-axis.


```r
getGeneric(".allowableYAxisChoices")
```

```
## standardGeneric for ".allowableYAxisChoices" defined from package "iSEE"
## 
## function (x, se) 
## standardGeneric(".allowableYAxisChoices")
## <bytecode: 0x7f9c9e0b0880>
## <environment: 0x7f9c9e0b91b0>
## Methods may be defined for arguments: x, se
## Use  showMethods(".allowableYAxisChoices")  for currently available ones.
```

```r
showMethods(".allowableYAxisChoices")
```

```
## Function: .allowableYAxisChoices (package iSEE)
## x="ColumnDataPlot"
## x="RowDataPlot"
```

```r
getGeneric(".allowableXAxisChoices")
```

```
## standardGeneric for ".allowableXAxisChoices" defined from package "iSEE"
## 
## function (x, se) 
## standardGeneric(".allowableXAxisChoices")
## <bytecode: 0x7f9c9e0dd198>
## <environment: 0x7f9c9e0e39e8>
## Methods may be defined for arguments: x, se
## Use  showMethods(".allowableXAxisChoices")  for currently available ones.
```

```r
showMethods(".allowableXAxisChoices")
```

```
## Function: .allowableXAxisChoices (package iSEE)
## x="ColumnDataPlot"
## x="RowDataPlot"
```

### For `Table`s

[`.generateTable()`](https://isee.github.io/iSEE/reference/table-generics.html) creates the `data.frame` that is rendered into the table widget for `Table` subclasses.
Each row of the `data.frame` is generally expected to correspond to a row or column of the dataset.
If this is specialized, there is usually no need to specialize `.generateOutput()`.


```r
getGeneric(".generateTable")
```

```
## standardGeneric for ".generateTable" defined from package "iSEE"
## 
## function (x, envir) 
## standardGeneric(".generateTable")
## <bytecode: 0x7f9c9c78c388>
## <environment: 0x7f9c9c79d040>
## Methods may be defined for arguments: x, envir
## Use  showMethods(".generateTable")  for currently available ones.
```

```r
showMethods(".generateTable")
```

```
## Function: .generateTable (package iSEE)
## x="ColumnDataTable"
## x="RowDataTable"
```

## Handling selections

### Multiple

[`.multiSelectionDimension()`](https://isee.github.io/iSEE/reference/multi-select-generics.html) specifies whether the panel transmits multiple selections along the rows or columns.
It can also be used to indicate that the panel does not transmit anything.


```r
getGeneric(".multiSelectionDimension")
```

```
## standardGeneric for ".multiSelectionDimension" defined from package "iSEE"
## 
## function (x) 
## standardGeneric(".multiSelectionDimension")
## <bytecode: 0x7f9c9c692cc0>
## <environment: 0x7f9c9c6986d8>
## Methods may be defined for arguments: x
## Use  showMethods(".multiSelectionDimension")  for currently available ones.
```

```r
showMethods(".multiSelectionDimension")
```

```
## Function: .multiSelectionDimension (package iSEE)
## x="ColumnDotPlot"
## x="ColumnTable"
## x="Panel"
## x="RowDotPlot"
## x="RowTable"
```

[`.multiSelectionActive()`](https://isee.github.io/iSEE/reference/multi-select-generics.html) returns the parameters that define the "active" multiple selection in the current panel.
This is defined as the selection that the user can actively change by interacting with the panel.
(In contrast, the "saved" selections are fixed and can only be deleted.)


```r
getGeneric(".multiSelectionActive")
```

```
## standardGeneric for ".multiSelectionActive" defined from package "iSEE"
## 
## function (x) 
## standardGeneric(".multiSelectionActive")
## <bytecode: 0x7f9c9c71d6a0>
## <environment: 0x7f9c9c722478>
## Methods may be defined for arguments: x
## Use  showMethods(".multiSelectionActive")  for currently available ones.
```

```r
showMethods(".multiSelectionActive")
```

```
## Function: .multiSelectionActive (package iSEE)
## x="DotPlot"
## x="Panel"
## x="Table"
```

[`.multiSelectionCommands()`](https://isee.github.io/iSEE/reference/multi-select-generics.html) creates the character vector of row or column names for a multiple selection in the current panel. 
More specifically, it returns the commands that will then be evaluated to generate such character vectors.
The identity of the selected rows/columns will ultimately be transmitted to other panels to affect their behavior.


```r
getGeneric(".multiSelectionCommands")
```

```
## standardGeneric for ".multiSelectionCommands" defined from package "iSEE"
## 
## function (x, index) 
## standardGeneric(".multiSelectionCommands")
## <bytecode: 0x7f9c9c6b6520>
## <environment: 0x7f9c9c6bd218>
## Methods may be defined for arguments: x, index
## Use  showMethods(".multiSelectionCommands")  for currently available ones.
```

```r
showMethods(".multiSelectionCommands")
```

```
## Function: .multiSelectionCommands (package iSEE)
## x="DotPlot"
## x="Table"
```

[`.multiSelectionAvailable()`](https://isee.github.io/iSEE/reference/multi-select-generics.html) reports how many total points are available for selection in the current panel.
This is used for reporting "percent selected" statistics below each panel.


```r
getGeneric(".multiSelectionAvailable")
```

```
## standardGeneric for ".multiSelectionAvailable" defined from package "iSEE"
## 
## function (x, contents) 
## standardGeneric(".multiSelectionAvailable")
## <bytecode: 0x7f9c9c6fae38>
## <environment: 0x7f9c9c6fe818>
## Methods may be defined for arguments: x, contents
## Use  showMethods(".multiSelectionAvailable")  for currently available ones.
```

```r
showMethods(".multiSelectionAvailable")
```

```
## Function: .multiSelectionAvailable (package iSEE)
## x="Panel"
```

[`.multiSelectionClear()`](https://isee.github.io/iSEE/reference/multi-select-generics.html) eliminates the active multiple selection in the current panel.
This is used to wipe selections in response to changes to the plot content that cause those selections to be invalid.


```r
getGeneric(".multiSelectionClear")
```

```
## standardGeneric for ".multiSelectionClear" defined from package "iSEE"
## 
## function (x) 
## standardGeneric(".multiSelectionClear")
## <bytecode: 0x7f9c9c6d7f50>
## <environment: 0x7f9c9c6e0a40>
## Methods may be defined for arguments: x
## Use  showMethods(".multiSelectionClear")  for currently available ones.
```

```r
showMethods(".multiSelectionClear")
```

```
## Function: .multiSelectionClear (package iSEE)
## x="DotPlot"
## x="Panel"
```

[`.multiSelectionRestricted()`](https://isee.github.io/iSEE/reference/multi-select-generics.html) indicates whether the current panel's data should be restricted to the rows/columns that it receives from an incoming multiple selection.
This is used to determine how changes in the upstream transmitters should propagate through to the current panel's children.


```r
getGeneric(".multiSelectionRestricted")
```

```
## standardGeneric for ".multiSelectionRestricted" defined from package "iSEE"
## 
## function (x) 
## standardGeneric(".multiSelectionRestricted")
## <bytecode: 0x7f9c9c648610>
## <environment: 0x7f9c9c64b688>
## Methods may be defined for arguments: x
## Use  showMethods(".multiSelectionRestricted")  for currently available ones.
```

```r
showMethods(".multiSelectionRestricted")
```

```
## Function: .multiSelectionRestricted (package iSEE)
## x="DotPlot"
## x="Panel"
```

[`.multiSelectionInvalidated()`](https://isee.github.io/iSEE/reference/multi-select-generics.html) indicates whether the current panel is invalidated when it receives a new multiple selection.
This usually doesn't need to be specialized.


```r
getGeneric(".multiSelectionInvalidated")
```

```
## standardGeneric for ".multiSelectionInvalidated" defined from package "iSEE"
## 
## function (x) 
## standardGeneric(".multiSelectionInvalidated")
## <bytecode: 0x7f9c9c667b60>
## <environment: 0x7f9c9c66b7a8>
## Methods may be defined for arguments: x
## Use  showMethods(".multiSelectionInvalidated")  for currently available ones.
```

```r
showMethods(".multiSelectionInvalidated")
```

```
## Function: .multiSelectionInvalidated (package iSEE)
## x="Panel"
```

### Single 

[`.singleSelectionDimension()`](https://isee.github.io/iSEE/reference/single-select-generics.html) specifies whether the panel transmits single selections of a row or column.
It can also be used to indicate that the panel does not transmit anything.


```r
getGeneric(".singleSelectionDimension")
```

```
## standardGeneric for ".singleSelectionDimension" defined from package "iSEE"
## 
## function (x) 
## standardGeneric(".singleSelectionDimension")
## <bytecode: 0x7f9c9df67848>
## <environment: 0x7f9c9df6d228>
## Methods may be defined for arguments: x
## Use  showMethods(".singleSelectionDimension")  for currently available ones.
```

```r
showMethods(".singleSelectionDimension")
```

```
## Function: .singleSelectionDimension (package iSEE)
## x="ColumnDotPlot"
## x="ColumnTable"
## x="Panel"
## x="RowDotPlot"
## x="RowTable"
```

[`.singleSelectionValue()`](https://isee.github.io/iSEE/reference/single-select-generics.html) determines the row or column that has been selected in the current panel.
The identity of the row/column is passed onto other panels to affect their behavior.


```r
getGeneric(".singleSelectionValue")
```

```
## standardGeneric for ".singleSelectionValue" defined from package "iSEE"
## 
## function (x, pObjects) 
## standardGeneric(".singleSelectionValue")
## <bytecode: 0x7f9c9df117d8>
## <environment: 0x7f9c9df17570>
## Methods may be defined for arguments: x, pObjects
## Use  showMethods(".singleSelectionValue")  for currently available ones.
```

```r
showMethods(".singleSelectionValue")
```

```
## Function: .singleSelectionValue (package iSEE)
## x="DotPlot"
## x="Table"
```

[`.singleSelectionSlots()`](https://isee.github.io/iSEE/reference/single-select-generics.html) determines how the current panel should respond to single selections from other panels.
This will also automatically set up some of the more difficult observers if sufficient information is supplied by the class.


```r
getGeneric(".singleSelectionValue")
```

```
## standardGeneric for ".singleSelectionValue" defined from package "iSEE"
## 
## function (x, pObjects) 
## standardGeneric(".singleSelectionValue")
## <bytecode: 0x7f9c9df117d8>
## <environment: 0x7f9c9df17570>
## Methods may be defined for arguments: x, pObjects
## Use  showMethods(".singleSelectionValue")  for currently available ones.
```

```r
showMethods(".singleSelectionValue")
```

```
## Function: .singleSelectionValue (package iSEE)
## x="DotPlot"
## x="Table"
```

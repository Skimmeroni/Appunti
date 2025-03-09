#import "../Unsupervised_definitions.typ": *

It is unrealistic to expect that raw data will be perfect, and that it
is usable as is. The spuriousness of data can be due to a multitude of
reasons, such as:

- Human error;
- Limited precision of measuring devices;
- Biased data collection (the sample does not properly represent
  its population);
- Missing information (objects have one or more unknown attribute
  values);
- Duplicate information (an object with the same or almost the same
  attribute values appears more than once).

The measure of how usable a dataset is is called *data quality*.
The approach that data mining takes in tackling poor data quality
is twofold: detecting and correcting spurious data objects and/or
attribute values so that raw data becomes manageable and designing
flexible algorithms that can tolerate imperfections. Preprocessing
(raw) data in order to increase its quality is referred to as *data
cleaning*.

The term *measurement error* refers to any problem resulting from the
measurement process. The most commonplace measurement error is a recorded
attribute value that differs from its true value. For continuous attributes,
the difference between the measured value and true value is called the
*error*. The term *data collection error* refers instead to errors such
as omitting data objects or attribute values, or inappropriately including
a data object that should not be there.

*Noise* is the random component of a measurement error. With respect
to objects, it entails the addition of an object to a dataset where
it should not belong, whereas with respect to attribute values it
entails a distortion of its original value. Eliminating noise completely
is impossible; the only realistic approach is to design algorithms that
are noise-tollerant.

*Outliers* are either data objects whose attribute values differ noticeably
with respect to the others or attribute values that differ noticeably from
their mean. They differ from noise in the sense that they are legitimate
data objects, and therefore their presence in the dataset is justified and
a model must account for them. In particular, there are situations where
outliers are the interest of the analysis itself (*anomaly detection*).

#exercise[
  Put outliers from a sample dataset under the spotlight.
]
#solution[
  The following dataset has been created using the `make_blobs` function
  from the Python package `scikit-learn`. The blue dots are the data
  objects that an algorithm (`DBSCAN`) has classified as outliers.

  #align(center, [#image("outlier.svg", width: 75%)])
]

In addition to being spurious, data can also be lackluster. It is therefore
expected that some attribute values will be missing. This could be due to,
for example, lack of knowledge or not all attributes being applicable to all
objects. Regardless, missing values must be taken into account during data
analysis, and there are different strategies to accomplish this goal.

One approach consists in discarding all objects that have one or more
missing attribute values or, even more drastically, discard all attributes
that have one or more missing attribute values. Even though this approach
is easy, it might backfire, since even partially known data objects can be
valuable for an analysis, and removing them might prevent seeing the bigger
picture. Therefore, the approach makes sense only if the missing attribute
values are a small fraction of the total (it should be noted that in real
datasets this is hardly the case).

A more refined approach consists in estimating missing values from the
known ones. This is reasonable when the values vary smoothly, or when
the values are concentrated around the average. If the attribute is
continuous, then the average attribute value of the nearest neighbors
is used; if the attribute is categorical, then the most commonly occurring
attribute value can be taken. In some situations, the missing values can
simply be ignored, albeit the accuracy of the model might suffer.

The last issue regarding data quality is the presence of duplicate, or
almost duplicate, objects. This issue often arises when merging data
coming from different sources but that refer to the same entities, where
the same entity appears as object in many sources but its attribute values
are slightly different. The process of unifying two or more objects into
a single one, so that an entity is referred to just once, is called *entity
linking*.

If there are two objects that actually represent a single object, then
one or more values of corresponding attributes are usually different,
and these inconsistent values must be resolved. This can be done either
averaging the two values (with numerical attributes) or picking one of
the two. Care should be taken in order to avoid merging two similar objects
that represent two different entities (for example, two distinct people
having the same name or two transactions containing the same items). It
should be noted that, in some circumstances, two or more objects with the
same attribute values for each attribute refer to different entities, and
therefore the presence of a duplicate is legitimate.

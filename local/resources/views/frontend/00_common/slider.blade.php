<div id="slider">
    <div class="slider-wrapper theme-default">
        <div id="slider" class="nivoSlider">
            @php
                $sliderImage=json_decode($listFrontendCommon['config_slider']);
            @endphp
            @foreach($sliderImage as $key=>$item)
                {{ Html::image($item->path,'',array('class'=>'slideshow')) }}
            @endforeach
        </div>
    </div>
</div>
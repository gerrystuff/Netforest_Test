const mongoose = require('mongoose');
const { Schema, model } = mongoose;

const ArticleSchema = Schema({
    author: {
        type: String,
        required: true
    },
    title: {
        type: String,
        required: true
    },
    description: {
        type: String,
        required: true
    },
    url: {
        type: String,
        required: true
    },
    urlToImage: {
        type: String,
        required: true
    },
    publishedAt: {
        type: Date,
        required: true
    }
}, {
    timestamps: true
});

ArticleSchema.statics.getFieldsInfo = function () {
    return Object.keys(this.schema.paths)
        .map(field => ({
            name: field,
            properties: this.schema.paths[field]
        }));
};

const Articles = model('articles', ArticleSchema);

module.exports = Articles;